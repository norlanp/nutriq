import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

enum CloudProvider { none, iCloud, googleDrive }

class EncryptedBackupService {
  final DataExportService _exportService;
  final DataImportService _importService;

  EncryptedBackupService(this._exportService, this._importService);

  Future<String> createEncryptedBackup(
    Set<DataType> dataTypes,
    String password,
  ) async {
    if (kIsWeb) {
      throw UnsupportedError('Encrypted backup not available on web');
    }

    final exportPath = await _exportService.exportData(
      dataTypes,
      ExportFormat.json,
    );

    final exportBytes = await file_helper.readFileBytes(exportPath);

    final key = Key.fromUtf8(_padKey(password));
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encryptBytes(exportBytes, iv: iv);

    final buffer = BytesBuilder();
    buffer.add(iv.bytes);
    buffer.add(encrypted.bytes);

    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final backupPath = p.join(dir.path, 'nutriq_backup_$timestamp.enc');
    await file_helper.writeTempFile(
        'nutriq_backup_$timestamp.enc', Uint8List.fromList(buffer.toBytes()));

    return backupPath;
  }

  Future<ImportResult> restoreFromEncryptedBackup(
    String filePath,
    String password,
  ) async {
    if (kIsWeb) return ImportResult.error;

    try {
      final encryptedBytes = await file_helper.readFileBytes(filePath);

      if (encryptedBytes.length < 16) return ImportResult.error;

      final ivBytes = encryptedBytes.sublist(0, 16);
      final cipherBytes = encryptedBytes.sublist(16);

      final iv = IV(ivBytes);
      final key = Key.fromUtf8(_padKey(password));

      final encrypter = Encrypter(AES(key));
      final decrypted = encrypter.decryptBytes(
        Encrypted(cipherBytes),
        iv: iv,
      );

      final jsonString = utf8.decode(decrypted);
      final data = jsonDecode(jsonString) as Map<String, dynamic>;

      await _importService.importDataFromMap(data);
      return ImportResult.success;
    } catch (e) {
      return ImportResult.error;
    }
  }

  Future<String?> getLastBackupPath() async {
    if (kIsWeb || !file_helper.hasFileSupport) return null;
    // Backup files are stored in app documents — this is a native-only feature
    return null;
  }

  Future<DateTime?> getLastBackupDate() async {
    final path = await getLastBackupPath();
    if (path == null) return null;
    // Simplified — in practice, use file stat
    return DateTime.now();
  }

  Future<bool> uploadToCloud(CloudProvider provider, String localPath) async {
    return false;
  }

  Future<String?> downloadFromCloud(CloudProvider provider) async {
    return null;
  }

  String _padKey(String password) {
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
