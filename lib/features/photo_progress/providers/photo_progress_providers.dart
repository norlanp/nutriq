import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/add_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/delete_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/get_photos_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';

final addPhotoUsecaseProvider = Provider((ref) {
  return AddPhotoUsecase(ref.watch(photoProgressRepositoryProvider));
});

final getPhotosUsecaseProvider = Provider((ref) {
  return GetPhotosUsecase(ref.watch(photoProgressRepositoryProvider));
});

final deletePhotoUsecaseProvider = Provider((ref) {
  return DeletePhotoUsecase(ref.watch(photoProgressRepositoryProvider));
});

final photoStorageServiceProvider = Provider((ref) => PhotoStorageService());