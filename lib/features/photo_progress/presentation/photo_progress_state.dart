part of 'photo_progress_bloc.dart';

abstract class PhotoProgressState extends Equatable {
  const PhotoProgressState();

  @override
  List<Object?> get props => [];
}

class PhotoProgressInitial extends PhotoProgressState {}

class PhotoProgressLoading extends PhotoProgressState {}

class PhotoProgressLoaded extends PhotoProgressState {
  final List<PhotoProgressEntity> photos;

  const PhotoProgressLoaded({required this.photos});

  @override
  List<Object?> get props => [photos];
}

class PhotoProgressError extends PhotoProgressState {
  final String message;

  const PhotoProgressError(this.message);

  @override
  List<Object?> get props => [message];
}

class PhotoProgressComparing extends PhotoProgressState {
  final PhotoProgressEntity beforePhoto;
  final PhotoProgressEntity afterPhoto;

  const PhotoProgressComparing({
    required this.beforePhoto,
    required this.afterPhoto,
  });

  @override
  List<Object?> get props => [beforePhoto, afterPhoto];
}
