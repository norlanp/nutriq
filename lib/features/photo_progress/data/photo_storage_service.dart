import 'package:image_picker/image_picker.dart';
import 'package:nutriq/core/utils/file_helper_io.dart'
    as file_helper;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class PhotoStorageService {
  static const String _photoDir = 'photo_progress';

  Future<String> savePhoto(XFile photo) async {
    final dir = await _getPhotoDirectory();
    final fileName =
        'photo_${DateTime.now().millisecondsSinceEpoch}${p.extension(photo.path)}';
    final filePath = p.join(dir, fileName);
    await photo.saveTo(filePath);
    return fileName;
  }

  Future<String> savePhotoFromFile(String sourcePath) async {
    final dir = await _getPhotoDirectory();
    final fileName =
        'photo_${DateTime.now().millisecondsSinceEpoch}${p.extension(sourcePath)}';
    final destPath = p.join(dir, fileName);
    final bytes = await file_helper.readFileBytes(sourcePath);
    await file_helper.writeTempFile(fileName, bytes);
    await file_helper.copyFile(sourcePath, destPath);
    return fileName;
  }

  Future<String> getFullPath(String relativePath) async {
    final dir = await _getPhotoDirectory();
    return p.join(dir, relativePath);
  }

  Future<void> deletePhoto(String relativePath) async {
    final fullPath = await getFullPath(relativePath);
    await file_helper.deleteFile(fullPath);
  }

  Future<String> _getPhotoDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    return p.join(appDir.path, _photoDir);
  }
}
