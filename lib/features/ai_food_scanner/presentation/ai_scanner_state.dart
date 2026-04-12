part of 'ai_scanner_bloc.dart';

abstract class AiScannerState extends Equatable {
  const AiScannerState();

  @override
  List<Object?> get props => [];
}

class AiScannerInitial extends AiScannerState {
  const AiScannerInitial();
}

class AiScannerCapturing extends AiScannerState {
  const AiScannerCapturing();
}

class AiScannerCaptureCancelled extends AiScannerState {
  const AiScannerCaptureCancelled();
}

class AiScannerClassified extends AiScannerState {
  final List<FoodCandidateEntity> results;

  const AiScannerClassified({required this.results});

  @override
  List<Object?> get props => [results];
}

class AiScannerResultSelected extends AiScannerState {
  final FoodCandidateEntity candidate;

  const AiScannerResultSelected({required this.candidate});

  @override
  List<Object?> get props => [candidate];
}

class AiScannerManualSearch extends AiScannerState {
  const AiScannerManualSearch();
}

class AiScannerError extends AiScannerState {
  final String message;

  const AiScannerError({required this.message});

  @override
  List<Object?> get props => [message];
}
