import 'dart:io';
import 'dart:typed_data';

Future<String> writeTempFile(String name, Uint8List bytes) async {
  final tempDir = Directory.systemTemp;
  final file = File('${tempDir.path}/$name');
  await file.writeAsBytes(bytes);
  return file.path;
}

Future<Uint8List> readFileBytes(String path) async {
  final file = File(path);
  return await file.readAsBytes();
}

Future<void> copyFile(String source, String destination) async {
  final sourceFile = File(source);
  await sourceFile.copy(destination);
}

Future<void> deleteFile(String path) async {
  final file = File(path);
  if (await file.exists()) {
    await file.delete();
  }
}

bool get hasFileSupport => true;
