import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart';

class GetPhotosUsecase {
  final PhotoProgressRepository _photoProgressRepository;

  GetPhotosUsecase(this._photoProgressRepository);

  Future<List<PhotoProgressEntity>> getPhotosByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _photoProgressRepository.getPhotosByDateRange(startDate, endDate);

  Future<PhotoProgressEntity?> getLatestPhoto() =>
      _photoProgressRepository.getLatestPhoto();

  Future<List<PhotoProgressEntity>> getAllPhotos() =>
      _photoProgressRepository.getAllPhotos();
}
