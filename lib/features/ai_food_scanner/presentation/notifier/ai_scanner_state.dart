import 'package:equatable/equatable.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';

enum AiScannerStatus {
  initial,
  capturing,
  captureCancelled,
  classified,
  resultSelected,
  manualSearch,
  error,
}

class AiScannerState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final AiScannerStatus status;
  final List<FoodCandidateEntity> results;
  final FoodCandidateEntity? selectedCandidate;

  const AiScannerState({
    this.isLoading = false,
    this.errorMessage,
    this.status = AiScannerStatus.initial,
    this.results = const [],
    this.selectedCandidate,
  });

  bool get hasError => errorMessage != null;

  AiScannerState copyWith({
    bool? isLoading,
    String? errorMessage,
    AiScannerStatus? status,
    List<FoodCandidateEntity>? results,
    FoodCandidateEntity? selectedCandidate,
  }) {
    return AiScannerState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      status: status ?? this.status,
      results: results ?? this.results,
      selectedCandidate: selectedCandidate,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, status, results, selectedCandidate];
}