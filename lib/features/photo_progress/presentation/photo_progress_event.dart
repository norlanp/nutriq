part of 'photo_progress_bloc.dart';

abstract class PhotoProgressEvent extends Equatable {
  const PhotoProgressEvent();

  @override
  List<Object?> get props => [];
}

class LoadPhotos extends PhotoProgressEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadPhotos({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class AddPhoto extends PhotoProgressEvent {
  final PhotoProgressEntity photo;

  const AddPhoto(this.photo);

  @override
  List<Object?> get props => [photo];
}

class DeletePhoto extends PhotoProgressEvent {
  final PhotoProgressEntity photo;

  const DeletePhoto(this.photo);

  @override
  List<Object?> get props => [photo];
}

class ComparePhotos extends PhotoProgressEvent {
  final PhotoProgressEntity beforePhoto;
  final PhotoProgressEntity afterPhoto;

  const ComparePhotos({required this.beforePhoto, required this.afterPhoto});

  @override
  List<Object?> get props => [beforePhoto, afterPhoto];
}
