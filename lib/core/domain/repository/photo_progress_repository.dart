import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';

abstract class PhotoProgressRepository {
  Future<List<PhotoProgressEntity>> getPhotosByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<PhotoProgressEntity?> getLatestPhoto();

  Future<void> addPhoto(PhotoProgressEntity entity);

  Future<void> deletePhoto(PhotoProgressEntity entity);

  Future<List<PhotoProgressEntity>> getAllPhotos();
}
