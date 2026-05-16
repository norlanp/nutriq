import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/utils/file_helper_io.dart' as file_helper;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pointycastle/export.dart' as pc;

enum CloudProvider { none, iCloud, googleDrive }

class EncryptedBackupService {
  final DataExportService _exportService;
  final DataImportService _importService;

  static const int _pbkdf2Iterations = 100000;
  static const int _saltLength = 32;
  static const int _ivLength = 12;

  EncryptedBackupService(this._exportService, this._importService);

  Future<String> createEncryptedBackup(
    Set<DataType> dataTypes,
    String password,
  ) async {
    final exportPath = await _exportService.exportData(
      dataTypes,
      ExportFormat.json,
    );

    final exportBytes = await file_helper.readFileBytes(exportPath);

    final salt = _generateSalt();
    final iv = IV.fromLength(_ivLength);
    final key = _deriveKey(password, salt);

    final encrypter = Encrypter(AES(key, mode: AESMode.gcm));
    final encrypted = encrypter.encryptBytes(exportBytes, iv: iv);

    final buffer = BytesBuilder();
    buffer.add(ascii.encode('NQ1'));
    buffer.add(salt);
    buffer.add(iv.bytes);
    buffer.add(encrypted.bytes);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final backupPath = p.join(
        (await getApplicationDocumentsDirectory()).path,
        'nutriq_backup_$timestamp.enc');
    await file_helper.writeTempFile(
        'nutriq_backup_$timestamp.enc', Uint8List.fromList(buffer.toBytes()));

    return backupPath;
  }

  Future<ImportResult> restoreFromEncryptedBackup(
    String filePath,
    String password,
  ) async {
    try {
      final encryptedBytes = await file_helper.readFileBytes(filePath);

      if (encryptedBytes.length < 3 + _saltLength + _ivLength + 16) {
        return ImportResult.error;
      }

      int offset = 0;
      final magic = ascii.decode(encryptedBytes.sublist(0, 3));
      offset += 3;

      if (magic == 'NQ1') {
        final salt = encryptedBytes.sublist(offset, offset + _saltLength);
        offset += _saltLength;
        final iv = IV(encryptedBytes.sublist(offset, offset + _ivLength));
        offset += _ivLength;
        final cipherBytes = encryptedBytes.sublist(offset);

        final key = _deriveKey(password, Uint8List.fromList(salt));
        final encrypter = Encrypter(AES(key, mode: AESMode.gcm));
        final decrypted = encrypter.decryptBytes(
          Encrypted(cipherBytes),
          iv: iv,
        );

        final jsonString = utf8.decode(decrypted);
        final data = jsonDecode(jsonString) as Map<String, dynamic>;

        await _importService.importDataFromMap(data);
        return ImportResult.success;
      }

      final iv = IV(encryptedBytes.sublist(0, 16));
      final cipherBytes = encryptedBytes.sublist(16);
      final key = Key.fromUtf8(_padKeyLegacy(password));

      final encrypter = Encrypter(AES(key));
      final decrypted = encrypter.decryptBytes(
        Encrypted(cipherBytes),
        iv: iv,
      );

      final jsonString = utf8.decode(decrypted);
      final data = jsonDecode(jsonString) as Map<String, dynamic>;

      await _importService.importDataFromMap(data);
      return ImportResult.success;
    } catch (_) {
      return ImportResult.error;
    }
  }

  Future<String?> getLastBackupPath() async {
    return null;
  }

  Future<DateTime?> getLastBackupDate() async {
    final path = await getLastBackupPath();
    if (path == null) return null;
    return DateTime.now();
  }

  Future<bool> uploadToCloud(CloudProvider provider, String localPath) async {
    return false;
  }

  Future<String?> downloadFromCloud(CloudProvider provider) async {
    return null;
  }

  Key _deriveKey(String password, Uint8List salt) {
    final params = pc.Pbkdf2Parameters(salt, _pbkdf2Iterations, 32);
    final hmac = pc.HMac(pc.SHA256Digest(), 64);
    final derivator = pc.KeyDerivator('PBKDF2')
      ..init(params);
    final result = derivator.process(Uint8List.fromList(utf8.encode(password)));
    return Key(result);
  }

  Uint8List _generateSalt() {
    final random = Random.secure();
    return Uint8List.fromList(
      List.generate(_saltLength, (_) => random.nextInt(256)),
    );
  }

  String _padKeyLegacy(String password) {
    final codeUnits = password.codeUnits;
    if (codeUnits.length >= 32) {
      return String.fromCharCodes(codeUnits.sublist(0, 32));
    }
    final padded = List<int>.filled(32, 0);
    for (var i = 0; i < codeUnits.length && i < 32; i++) {
      padded[i] = codeUnits[i];
    }
    return String.fromCharCodes(padded);
  }
}