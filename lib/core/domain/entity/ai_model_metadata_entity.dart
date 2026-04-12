import 'package:equatable/equatable.dart';

class AiModelMetadataEntity extends Equatable {
  final int id;
  final String modelVersion;
  final String assetPath;
  final DateTime lastUpdated;

  const AiModelMetadataEntity({
    required this.id,
    required this.modelVersion,
    required this.assetPath,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [id, modelVersion, assetPath, lastUpdated];
}
