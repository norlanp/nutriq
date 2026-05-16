import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';

class PhotoProgressState extends Equatable {
  final List<PhotoProgressEntity> photos;
  final bool isLoading;
  final String? errorMessage;
  final PhotoProgressEntity? compareBefore;
  final PhotoProgressEntity? compareAfter;

  const PhotoProgressState({
    this.photos = const [],
    this.isLoading = false,
    this.errorMessage,
    this.compareBefore,
    this.compareAfter,
  });

  bool get isLoaded => photos.isNotEmpty;
  bool get hasError => errorMessage != null;
  bool get isComparing => compareBefore != null && compareAfter != null;

  @override
  List<Object?> get props => [photos, isLoading, errorMessage, compareBefore, compareAfter];
}