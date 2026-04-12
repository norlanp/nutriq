import 'dart:typed_data';

/// Writes bytes to a temp file and returns the path.
/// Implementation provided via conditional import.
Future<String> writeTempFile(String name, Uint8List bytes) =>
    throw UnsupportedError('Stub — use conditional import');

/// Reads a file as bytes from the given path.
Future<Uint8List> readFileBytes(String path) =>
    throw UnsupportedError('Stub — use conditional import');

/// Copies a file from source to destination.
Future<void> copyFile(String source, String destination) =>
    throw UnsupportedError('Stub — use conditional import');

/// Deletes a file at the given path.
Future<void> deleteFile(String path) =>
    throw UnsupportedError('Stub — use conditional import');

/// Checks if dart:io File/Directory are available.
bool get hasFileSupport => false;
