import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';
import 'package:nutriq/core/utils/calc/met_calc.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/features/activity_detail/presentation/notifier/activity_detail_state.dart';

class ActivityDetailNotifier extends Notifier<ActivityDetailState> {
  @override
  ActivityDetailState build() => const ActivityDetailState();

  Future<void> loadActivityDetail(PhysicalActivityEntity physicalActivity) async {
    state = const ActivityDetailState(isLoading: true);
    const quantityDefault = 60.0;
    try {
      final user = await ref.read(getUserUsecaseProvider).getUserData();
      final totalBurnedKcal = METCalc.getTotalBurnedKcal(user, physicalActivity, quantityDefault);
      state = ActivityDetailState(
        totalKcalBurned: totalBurnedKcal,
        userEntity: user,
        quantityMin: quantityDefault.toInt(),
        physicalActivity: physicalActivity,
        isLoaded: true,
      );
    } catch (e) {
      state = ActivityDetailState(errorMessage: e.toString());
    }
  }

  double getTotalKcalBurned(UserEntity user, PhysicalActivityEntity physicalActivity, double duration) {
    return METCalc.getTotalBurnedKcal(user, physicalActivity, duration);
  }

  Future<void> persistActivity(
    String durationText,
    double totalKcalBurned,
    PhysicalActivityEntity activityEntity,
    DateTime day,
  ) async {
    final duration = double.parse(durationText);
    final userActivityEntity = UserActivityEntity(
      id: IdGenerator.getUniqueID(),
      duration: duration,
      burnedKcal: totalKcalBurned,
      date: day,
      physicalActivityEntity: activityEntity,
    );

    await ref.read(addUserActivityUsecaseProvider).addUserActivity(userActivityEntity);
    await _updateTrackedDay(day, totalKcalBurned);
  }

  Future<void> _updateTrackedDay(DateTime day, double caloriesBurned) async {
    final hasTrackedDay = await ref.read(addTrackedDayUsecaseProvider).hasTrackedDay(day);
    if (!hasTrackedDay) {
      final totalKcalGoal = await ref.read(getKcalGoalUsecaseProvider).getKcalGoal(totalKcalActivitiesParam: 0);
      final totalCarbsGoal = await ref.read(getMacroGoalUsecaseProvider).getCarbsGoal(totalKcalGoal);
      final totalFatGoal = await ref.read(getMacroGoalUsecaseProvider).getFatsGoal(totalKcalGoal);
      final totalProteinGoal = await ref.read(getMacroGoalUsecaseProvider).getProteinsGoal(totalKcalGoal);

      await ref.read(addTrackedDayUsecaseProvider).addNewTrackedDay(
          day, totalKcalGoal, totalCarbsGoal, totalFatGoal, totalProteinGoal);
    }

    final carbsIncrease = MacroCalc.getTotalCarbsGoal(caloriesBurned);
    final fatIncrease = MacroCalc.getTotalFatsGoal(caloriesBurned);
    final proteinIncrease = MacroCalc.getTotalProteinsGoal(caloriesBurned);

    await ref.read(addTrackedDayUsecaseProvider).increaseDayCalorieGoal(day, caloriesBurned);
    await ref.read(addTrackedDayUsecaseProvider).increaseDayMacroGoals(day,
        carbsAmount: carbsIncrease,
        fatAmount: fatIncrease,
        proteinAmount: proteinIncrease);
  }
}

final activityDetailNotifierProvider =
    NotifierProvider<ActivityDetailNotifier, ActivityDetailState>(ActivityDetailNotifier.new);