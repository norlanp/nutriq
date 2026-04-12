import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';
import 'package:nutriq/features/ai_food_scanner/domain/usecase/classify_food_usecase.dart';

part 'ai_scanner_event.dart';
part 'ai_scanner_state.dart';

class AiScannerBloc extends Bloc<AiScannerEvent, AiScannerState> {
  final ClassifyFoodUsecase _classifyFoodUsecase;

  AiScannerBloc(this._classifyFoodUsecase) : super(AiScannerInitial()) {
    on<CaptureAndClassify>(_onCaptureAndClassify);
    on<PickFromGallery>(_onPickFromGallery);
    on<SelectResult>(_onSelectResult);
    on<ManualSearchFallback>(_onManualSearchFallback);
  }

  Future<void> _onCaptureAndClassify(
    CaptureAndClassify event,
    Emitter<AiScannerState> emit,
  ) async {
    emit(AiScannerCapturing());
    try {
      final results = await _classifyFoodUsecase.captureAndClassify();
      if (results.isEmpty) {
        emit(AiScannerCaptureCancelled());
      } else {
        emit(AiScannerClassified(results: results));
      }
    } catch (e) {
      emit(AiScannerError(message: e.toString()));
    }
  }

  Future<void> _onPickFromGallery(
    PickFromGallery event,
    Emitter<AiScannerState> emit,
  ) async {
    emit(AiScannerCapturing());
    try {
      final results = await _classifyFoodUsecase.classifyFromGallery();
      if (results.isEmpty) {
        emit(AiScannerCaptureCancelled());
      } else {
        emit(AiScannerClassified(results: results));
      }
    } catch (e) {
      emit(AiScannerError(message: e.toString()));
    }
  }

  void _onSelectResult(
    SelectResult event,
    Emitter<AiScannerState> emit,
  ) {
    emit(AiScannerResultSelected(candidate: event.candidate));
  }

  void _onManualSearchFallback(
    ManualSearchFallback event,
    Emitter<AiScannerState> emit,
  ) {
    emit(AiScannerManualSearch());
  }
}
