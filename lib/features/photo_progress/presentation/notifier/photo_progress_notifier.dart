import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/features/photo_progress/presentation/notifier/photo_progress_state.dart';
import 'package:nutriq/features/photo_progress/providers/photo_progress_providers.dart';

class PhotoProgressNotifier extends Notifier<PhotoProgressState> {
  @override
  PhotoProgressState build() => const PhotoProgressState();

  Future<void> loadPhotos(DateTime startDate, DateTime endDate) async {
    state = const PhotoProgressState(isLoading: true);
    try {
      final photos = await ref.read(getPhotosUsecaseProvider).getPhotosByDateRange(
        startDate,
        endDate,
      );
      state = PhotoProgressState(photos: photos);
    } catch (e) {
      state = PhotoProgressState(errorMessage: e.toString());
    }
  }

  Future<void> addPhoto(PhotoProgressEntity photo) async {
    try {
      await ref.read(addPhotoUsecaseProvider).addPhoto(photo);
      final photos = await ref.read(getPhotosUsecaseProvider).getAllPhotos();
      state = PhotoProgressState(photos: photos);
    } catch (e) {
      state = PhotoProgressState(errorMessage: e.toString());
    }
  }

  Future<void> deletePhoto(PhotoProgressEntity photo) async {
    try {
      await ref.read(deletePhotoUsecaseProvider).deletePhoto(photo);
      final photos = await ref.read(getPhotosUsecaseProvider).getAllPhotos();
      state = PhotoProgressState(photos: photos);
    } catch (e) {
      state = PhotoProgressState(errorMessage: e.toString());
    }
  }

  void comparePhotos(PhotoProgressEntity before, PhotoProgressEntity after) {
    state = PhotoProgressState(
      photos: state.photos,
      compareBefore: before,
      compareAfter: after,
    );
  }
}

final photoProgressNotifierProvider =
    NotifierProvider<PhotoProgressNotifier, PhotoProgressState>(PhotoProgressNotifier.new);