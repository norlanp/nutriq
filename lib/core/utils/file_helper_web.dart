import 'dart:typed_data';

Future<String> writeTempFile(String name, Uint8List bytes) async {
  throw UnsupportedError('File operations not available on web');
}

Future<Uint8List> readFileBytes(String path) async {
  throw UnsupportedError('File operations not available on web');
}

Future<void> copyFile(String source, String destination) async {
  throw UnsupportedError('File operations not available on web');
}

Future<void> deleteFile(String path) async {
  throw UnsupportedError('File operations not available on web');
}

bool get hasFileSupport => false;
