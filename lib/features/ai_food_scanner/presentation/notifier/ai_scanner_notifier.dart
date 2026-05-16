import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/notifier/ai_scanner_state.dart';
import 'package:nutriq/features/ai_food_scanner/providers/ai_food_scanner_providers.dart';

class AiScannerNotifier extends Notifier<AiScannerState> {
  @override
  AiScannerState build() => const AiScannerState();

  Future<void> captureAndClassify() async {
    state = const AiScannerState(status: AiScannerStatus.capturing, isLoading: true);
    try {
      final results = await ref.read(classifyFoodUsecaseProvider).captureAndClassify();
      if (results.isEmpty) {
        state = const AiScannerState(status: AiScannerStatus.captureCancelled);
      } else {
        state = AiScannerState(status: AiScannerStatus.classified, results: results);
      }
    } catch (e) {
      state = AiScannerState(status: AiScannerStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> pickFromGallery() async {
    state = const AiScannerState(status: AiScannerStatus.capturing, isLoading: true);
    try {
      final results = await ref.read(classifyFoodUsecaseProvider).classifyFromGallery();
      if (results.isEmpty) {
        state = const AiScannerState(status: AiScannerStatus.captureCancelled);
      } else {
        state = AiScannerState(status: AiScannerStatus.classified, results: results);
      }
    } catch (e) {
      state = AiScannerState(status: AiScannerStatus.error, errorMessage: e.toString());
    }
  }

  void selectResult(FoodCandidateEntity candidate) {
    state = AiScannerState(
      status: AiScannerStatus.resultSelected,
      selectedCandidate: candidate,
      results: state.results,
    );
  }

  void manualSearchFallback() {
    state = const AiScannerState(status: AiScannerStatus.manualSearch);
  }
}

final aiScannerNotifierProvider =
    NotifierProvider<AiScannerNotifier, AiScannerState>(AiScannerNotifier.new);