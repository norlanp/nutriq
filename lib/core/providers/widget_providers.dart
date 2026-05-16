import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/widget/update_widget_data_usecase.dart';
import 'package:nutriq/core/providers/goal_providers.dart';
import 'package:nutriq/core/providers/intake_providers.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/core/providers/water_providers.dart';

final updateWidgetDataUsecaseProvider = Provider((ref) {
  return UpdateWidgetDataUsecase(
    ref.watch(widgetDataServiceProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
    ref.watch(getIntakeUsecaseProvider),
    ref.watch(getDailyWaterTotalUsecaseProvider),
  );
});