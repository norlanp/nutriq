import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart';

class DeletePhotoUsecase {
  final PhotoProgressRepository _photoProgressRepository;

  DeletePhotoUsecase(this._photoProgressRepository);

  Future<void> deletePhoto(PhotoProgressEntity entity) =>
      _photoProgressRepository.deletePhoto(entity);
}
