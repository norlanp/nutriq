import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/bmr_calculation_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/utils/calc/calorie_goal_calc.dart';

class CalculateBMRUsecase {
  BMRCalculationEntity call(UserEntity userEntity,
      {TDEEMethodEntity method = TDEEMethodEntity.mifflinStJeor}) {
    final bmr = CalorieGoalCalc.getBMR(userEntity, method: method);
    final tdee = CalorieGoalCalc.getTdee(userEntity, method: method);
    final activityMultiplier =
        CalorieGoalCalc.getActivityMultiplier(userEntity, method: method);

    return BMRCalculationEntity(
      bmr: bmr,
      tdee: tdee,
      activityMultiplier: activityMultiplier,
      activityLevel: userEntity.pal,
      method: method,
    );
  }
}
