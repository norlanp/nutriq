import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart';

class AddPhotoUsecase {
  final PhotoProgressRepository _photoProgressRepository;

  AddPhotoUsecase(this._photoProgressRepository);

  Future<void> addPhoto(PhotoProgressEntity entity) =>
      _photoProgressRepository.addPhoto(entity);
}
