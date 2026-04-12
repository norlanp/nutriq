part of 'ai_scanner_bloc.dart';

abstract class AiScannerEvent extends Equatable {
  const AiScannerEvent();

  @override
  List<Object?> get props => [];
}

class CaptureAndClassify extends AiScannerEvent {
  const CaptureAndClassify();
}

class PickFromGallery extends AiScannerEvent {
  const PickFromGallery();
}

class SelectResult extends AiScannerEvent {
  final FoodCandidateEntity candidate;

  const SelectResult({required this.candidate});

  @override
  List<Object?> get props => [candidate];
}

class ManualSearchFallback extends AiScannerEvent {
  const ManualSearchFallback();
}
