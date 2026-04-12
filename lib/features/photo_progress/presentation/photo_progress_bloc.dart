import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/add_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/delete_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/get_photos_usecase.dart';

part 'photo_progress_event.dart';
part 'photo_progress_state.dart';

class PhotoProgressBloc extends Bloc<PhotoProgressEvent, PhotoProgressState> {
  final GetPhotosUsecase _getPhotosUsecase;
  final AddPhotoUsecase _addPhotoUsecase;
  final DeletePhotoUsecase _deletePhotoUsecase;

  PhotoProgressBloc(
    this._getPhotosUsecase,
    this._addPhotoUsecase,
    this._deletePhotoUsecase,
  ) : super(PhotoProgressInitial()) {
    on<LoadPhotos>(_onLoadPhotos);
    on<AddPhoto>(_onAddPhoto);
    on<DeletePhoto>(_onDeletePhoto);
    on<ComparePhotos>(_onComparePhotos);
  }

  Future<void> _onLoadPhotos(
    LoadPhotos event,
    Emitter<PhotoProgressState> emit,
  ) async {
    emit(PhotoProgressLoading());
    try {
      final photos = await _getPhotosUsecase.getPhotosByDateRange(
        event.startDate,
        event.endDate,
      );
      emit(PhotoProgressLoaded(photos: photos));
    } catch (e) {
      emit(PhotoProgressError(e.toString()));
    }
  }

  Future<void> _onAddPhoto(
    AddPhoto event,
    Emitter<PhotoProgressState> emit,
  ) async {
    try {
      await _addPhotoUsecase.addPhoto(event.photo);
      final photos = await _getPhotosUsecase.getAllPhotos();
      emit(PhotoProgressLoaded(photos: photos));
    } catch (e) {
      emit(PhotoProgressError(e.toString()));
    }
  }

  Future<void> _onDeletePhoto(
    DeletePhoto event,
    Emitter<PhotoProgressState> emit,
  ) async {
    try {
      await _deletePhotoUsecase.deletePhoto(event.photo);
      final photos = await _getPhotosUsecase.getAllPhotos();
      emit(PhotoProgressLoaded(photos: photos));
    } catch (e) {
      emit(PhotoProgressError(e.toString()));
    }
  }

  Future<void> _onComparePhotos(
    ComparePhotos event,
    Emitter<PhotoProgressState> emit,
  ) async {
    emit(PhotoProgressComparing(
      beforePhoto: event.beforePhoto,
      afterPhoto: event.afterPhoto,
    ));
  }
}
