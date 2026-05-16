import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/ai_food_scanner/domain/usecase/classify_food_usecase.dart';

final classifyFoodUsecaseProvider = Provider((ref) {
  return ClassifyFoodUsecase(ref.watch(foodClassifierServiceProvider));
});