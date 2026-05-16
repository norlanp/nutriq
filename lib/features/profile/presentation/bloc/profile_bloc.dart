import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/bmr_calculation_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_bmi_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/bmr/calculate_bmr_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/core/utils/calc/bmi_calc.dart';
import 'package:nutriq/core/utils/calc/unit_calc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

typedef RefreshHomeCallback = void Function();
typedef RefreshDiaryCallback = void Function();
typedef RefreshCalendarDayCallback = void Function();

typedef _ProfileRefreshCallbacks = ({
  RefreshHomeCallback refreshHome,
  RefreshDiaryCallback refreshDiary,
  RefreshCalendarDayCallback refreshCalendarDay,
});

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserUsecase _getUserUsecase;
  final AddUserUsecase _addUserUsecase;
  final AddTrackedDayUsecase _addTrackedDayUsecase;
  final GetConfigUsecase _getConfigUsecase;
  final GetKcalGoalUsecase _getKcalGoalUsecase;
  final AddConfigUsecase _addConfigUsecase;
  final CalculateBMRUsecase _calculateBMRUsecase;

  final _ProfileRefreshCallbacks _refreshCallbacks;

  ProfileBloc(
      this._getUserUsecase,
      this._addUserUsecase,
      this._addTrackedDayUsecase,
      this._getConfigUsecase,
      this._getKcalGoalUsecase,
      this._addConfigUsecase,
      this._calculateBMRUsecase,
      this._refreshCallbacks)
      : super(ProfileInitial()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());

      final user = await _getUserUsecase.getUserData();
      final userBMIValue = BMICalc.getBMI(user);
      final userBMIEntity = UserBMIEntity(
          bmiValue: userBMIValue,
          nutritionalStatus: BMICalc.getNutritionalStatus(userBMIValue));
      final userConfig = await _getConfigUsecase.getConfig();
      final bmrCalculation =
          _calculateBMRUsecase(user, method: userConfig.tdeeMethod);

      emit(ProfileLoadedState(
          userBMI: userBMIEntity,
          userEntity: user,
          usesImperialUnits: userConfig.usesImperialUnits,
          bmrCalculation: bmrCalculation,
          tdeeMethod: userConfig.tdeeMethod));
    });

    on<ChangeTDEEMethodEvent>((event, emit) async {
      await _addConfigUsecase.setConfigTDEEMethod(event.method);

      final user = await _getUserUsecase.getUserData();
      final userBMIValue = BMICalc.getBMI(user);
      final userBMIEntity = UserBMIEntity(
          bmiValue: userBMIValue,
          nutritionalStatus: BMICalc.getNutritionalStatus(userBMIValue));
      final userConfig = await _getConfigUsecase.getConfig();
      final bmrCalculation =
          _calculateBMRUsecase(user, method: userConfig.tdeeMethod);

      emit(ProfileLoadedState(
          userBMI: userBMIEntity,
          userEntity: user,
          usesImperialUnits: userConfig.usesImperialUnits,
          bmrCalculation: bmrCalculation,
          tdeeMethod: userConfig.tdeeMethod));

      _refreshCallbacks.refreshHome();
      _refreshCallbacks.refreshDiary();
      _refreshCallbacks.refreshCalendarDay();
    });
  }

  void updateUser(UserEntity userEntity) async {
    await _addUserUsecase.addUser(userEntity);

    await _updateTrackedDayCalorieGoal(userEntity, DateTime.now());

    add(LoadProfileEvent());
    _refreshCallbacks.refreshHome();
    _refreshCallbacks.refreshDiary();
    _refreshCallbacks.refreshCalendarDay();
  }

  Future<void> _updateTrackedDayCalorieGoal(
      UserEntity user, DateTime day) async {
    final hasTrackedDay = await _addTrackedDayUsecase.hasTrackedDay(day);
    if (hasTrackedDay) {
      final totalKcalGoal =
          await _getKcalGoalUsecase.getKcalGoal(userEntity: user);

      await _addTrackedDayUsecase.updateDayCalorieGoal(day, totalKcalGoal);
    }
  }

  /// Returns the user's height in cm or ft/in based on the user's config
  String getDisplayHeight(UserEntity user, bool usesImperialUnits) {
    if (usesImperialUnits) {
      // Convert cm to feet and inches
      return UnitCalc.cmToFeet(user.heightCM).toStringAsFixed(1);
    } else {
      return user.heightCM.roundToDouble().toStringAsFixed(0);
    }
  }

  /// Returns the user's weight in kg or lbs based on the user's config
  String getDisplayWeight(UserEntity user, bool usesImperialUnits) {
    if (usesImperialUnits) {
      return UnitCalc.kgToLbs(user.weightKG).toStringAsFixed(0);
    } else {
      return user.weightKG.roundToDouble().toStringAsFixed(0);
    }
  }
}
