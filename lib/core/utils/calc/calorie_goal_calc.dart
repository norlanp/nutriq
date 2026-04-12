import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/utils/calc/bmr_calc.dart';
import 'package:nutriq/core/utils/calc/pal_calc.dart';
import 'package:nutriq/core/utils/calc/tdee_calc.dart';

class CalorieGoalCalc {
  static const double loseWeightKcalAdjustment = -500;
  static const double maintainWeightKcalAdjustment = 0;
  static const double gainWeightKcalAdjustment = 500;

  static double getDailyKcalLeft(
          double totalKcalGoal, double totalKcalIntake) =>
      totalKcalGoal - totalKcalIntake;

  static double getTdee(UserEntity userEntity,
          {TDEEMethodEntity method = TDEEMethodEntity.iom2005}) =>
      _getTdeeByMethod(userEntity, method);

  static double getBMR(UserEntity userEntity,
          {TDEEMethodEntity method = TDEEMethodEntity.iom2005}) =>
      _getBMRByMethod(userEntity, method);

  static double getActivityMultiplier(UserEntity userEntity,
          {TDEEMethodEntity method = TDEEMethodEntity.iom2005}) =>
      _getActivityMultiplierByMethod(userEntity, method);

  static double getTotalKcalGoal(
          UserEntity userEntity, double totalKcalActivities,
          {double? kcalUserAdjustment,
          TDEEMethodEntity method = TDEEMethodEntity.iom2005}) =>
      getTdee(userEntity, method: method) +
      getKcalGoalAdjustment(userEntity.goal) +
      (kcalUserAdjustment ?? 0) +
      totalKcalActivities;

  static double getKcalGoalAdjustment(UserWeightGoalEntity goal) {
    double kcalAdjustment;
    if (goal == UserWeightGoalEntity.loseWeight) {
      kcalAdjustment = loseWeightKcalAdjustment;
    } else if (goal == UserWeightGoalEntity.gainWeight) {
      kcalAdjustment = gainWeightKcalAdjustment;
    } else {
      kcalAdjustment = maintainWeightKcalAdjustment;
    }
    return kcalAdjustment;
  }

  static double _getTdeeByMethod(
      UserEntity userEntity, TDEEMethodEntity method) {
    switch (method) {
      case TDEEMethodEntity.iom2005:
        return TDEECalc.getTDEEKcalIOM2005(userEntity);
      case TDEEMethodEntity.mifflinStJeor:
        return TDEECalc.getTDEEKcalMifflinStJeor(userEntity);
    }
  }

  static double _getBMRByMethod(
      UserEntity userEntity, TDEEMethodEntity method) {
    switch (method) {
      case TDEEMethodEntity.iom2005:
        return TDEECalc.getTDEEKcalIOM2005(userEntity);
      case TDEEMethodEntity.mifflinStJeor:
        return BMRCalc.getBMRMifflinStJeor1990(userEntity);
    }
  }

  static double _getActivityMultiplierByMethod(
      UserEntity userEntity, TDEEMethodEntity method) {
    switch (method) {
      case TDEEMethodEntity.iom2005:
        final pal = PalCalc.getPALValueFromActivityCategory(userEntity);
        final tdee = TDEECalc.getTDEEKcalIOM2005(userEntity);
        final bmr = BMRCalc.getBMRSchofield11985(userEntity);
        if (bmr == 0) return 1.0;
        return tdee / bmr;
      case TDEEMethodEntity.mifflinStJeor:
        return PalCalc.getMifflinActivityMultiplier(userEntity);
    }
  }
}
