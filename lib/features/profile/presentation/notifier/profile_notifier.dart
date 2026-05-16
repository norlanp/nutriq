import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_bmi_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/bmi_calc.dart';
import 'package:nutriq/core/utils/calc/unit_calc.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/profile/presentation/notifier/profile_state.dart';

class ProfileNotifier extends AsyncNotifier<ProfileState> {
  @override
  Future<ProfileState> build() async {
    return _loadProfile();
  }

  Future<ProfileState> _loadProfile() async {
    final user = await ref.read(getUserUsecaseProvider).getUserData();
    final userBMIValue = BMICalc.getBMI(user);
    final userBMIEntity = UserBMIEntity(
      bmiValue: userBMIValue,
      nutritionalStatus: BMICalc.getNutritionalStatus(userBMIValue),
    );
    final userConfig = await ref.read(getConfigUsecaseProvider).getConfig();
    final bmrCalculation = ref.read(calculateBMRUsecaseProvider)(
      user,
      method: userConfig.tdeeMethod,
    );

    return ProfileState(
      userBMI: userBMIEntity,
      userEntity: user,
      usesImperialUnits: userConfig.usesImperialUnits,
      bmrCalculation: bmrCalculation,
      tdeeMethod: userConfig.tdeeMethod,
    );
  }

  Future<void> loadProfile() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadProfile());
  }

  Future<void> changeTDEEMethod(TDEEMethodEntity method) async {
    await ref.read(addConfigUsecaseProvider).setConfigTDEEMethod(method);
    await loadProfile();
    _refreshAll();
  }

  Future<void> updateUser(UserEntity userEntity) async {
    await ref.read(addUserUsecaseProvider).addUser(userEntity);
    await _updateTrackedDayCalorieGoal(userEntity, DateTime.now());
    await loadProfile();
    _refreshAll();
  }

  Future<void> _updateTrackedDayCalorieGoal(
      UserEntity user, DateTime day) async {
    final hasTrackedDay =
        await ref.read(addTrackedDayUsecaseProvider).hasTrackedDay(day);
    if (hasTrackedDay) {
      final totalKcalGoal =
          await ref.read(getKcalGoalUsecaseProvider).getKcalGoal(
                userEntity: user,
              );
      await ref
          .read(addTrackedDayUsecaseProvider)
          .updateDayCalorieGoal(day, totalKcalGoal);
    }
  }

  void _refreshAll() {
    ref.read(homeNotifierProvider.notifier).loadItems();
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();
  }
}

String getDisplayHeight(UserEntity user, bool usesImperialUnits) {
  if (usesImperialUnits) {
    return UnitCalc.cmToFeet(user.heightCM).toStringAsFixed(1);
  } else {
    return user.heightCM.roundToDouble().toStringAsFixed(0);
  }
}

String getDisplayWeight(UserEntity user, bool usesImperialUnits) {
  if (usesImperialUnits) {
    return UnitCalc.kgToLbs(user.weightKG).toStringAsFixed(0);
  } else {
    return user.weightKG.roundToDouble().toStringAsFixed(0);
  }
}

final profileNotifierProvider =
    AsyncNotifierProvider<ProfileNotifier, ProfileState>(
        ProfileNotifier.new);