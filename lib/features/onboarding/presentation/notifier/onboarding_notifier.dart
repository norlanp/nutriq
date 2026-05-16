import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/calorie_goal_calc.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_data_mask_entity.dart';

class OnboardingNotifier extends Notifier<UserDataMaskEntity> {
  @override
  UserDataMaskEntity build() {
    return const UserDataMaskEntity();
  }

  void updateUserSelection(UserDataMaskEntity selection) {
    state = selection;
  }

  Future<void> saveOnboardingData(UserEntity userEntity,
      bool hasAcceptedDataCollection, bool usesImperialUnits) async {
    await ref.read(addUserUsecaseProvider).addUser(userEntity);
    await ref
        .read(addConfigUsecaseProvider)
        .setConfigHasAcceptedAnonymousData(hasAcceptedDataCollection);
    await ref
        .read(addConfigUsecaseProvider)
        .setConfigUsesImperialUnits(usesImperialUnits);
  }

  double? getOverviewCalorieGoal() {
    final userEntity = state.toUserEntity();
    if (userEntity != null) {
      return CalorieGoalCalc.getTotalKcalGoal(userEntity, 0);
    }
    return null;
  }

  double? getOverviewCarbsGoal() {
    final calorieGoal = getOverviewCalorieGoal();
    if (state.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalCarbsGoal(calorieGoal);
    }
    return null;
  }

  double? getOverviewFatGoal() {
    final calorieGoal = getOverviewCalorieGoal();
    if (state.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalFatsGoal(calorieGoal);
    }
    return null;
  }

  double? getOverviewProteinGoal() {
    final calorieGoal = getOverviewCalorieGoal();
    if (state.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalProteinsGoal(calorieGoal);
    }
    return null;
  }
}

final onboardingNotifierProvider =
    NotifierProvider<OnboardingNotifier, UserDataMaskEntity>(
        OnboardingNotifier.new);