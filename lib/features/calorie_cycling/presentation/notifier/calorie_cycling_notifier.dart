import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/calorie_cycling/presentation/notifier/calorie_cycling_state.dart';

class CalorieCyclingNotifier extends Notifier<CalorieCyclingState> {
  @override
  CalorieCyclingState build() => const CalorieCyclingState();

  Future<void> loadCycle() async {
    state = const CalorieCyclingState(isLoading: true);
    try {
      final entity = await ref.read(getCalorieCycleUsecaseProvider)();
      state = CalorieCyclingState(
        weekdayCalorieMap: entity.weekdayCalorieMap,
        isEnabled: entity.isEnabled,
      );
    } catch (e) {
      state = CalorieCyclingState(errorMessage: e.toString());
    }
  }

  Future<void> saveCycle(Map<int, double> weekdayCalorieMap) async {
    try {
      await ref.read(saveCalorieCycleUsecaseProvider)(
        CalorieCycleEntity(weekdayCalorieMap: weekdayCalorieMap, isEnabled: true),
      );
      state = CalorieCyclingState(
        weekdayCalorieMap: weekdayCalorieMap,
        isEnabled: true,
      );
      state = state.copyWith(justSaved: true);
      state = state.copyWith(justSaved: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> toggleCycling(bool enabled) async {
    try {
      await ref.read(saveCalorieCycleUsecaseProvider)(
        CalorieCycleEntity(weekdayCalorieMap: state.weekdayCalorieMap, isEnabled: enabled),
      );
      state = state.copyWith(isEnabled: enabled);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}

final calorieCyclingNotifierProvider =
    NotifierProvider<CalorieCyclingNotifier, CalorieCyclingState>(
        CalorieCyclingNotifier.new);