// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';

UserGenderEntity mapUserGenderStringToEntity(String gender) {
  switch (gender) {
    case 'male':
      return UserGenderEntity.male;
    default:
      return UserGenderEntity.female;
  }
}

String mapUserGenderEntityToString(UserGenderEntity entity) {
  switch (entity) {
    case UserGenderEntity.male:
      return 'male';
    case UserGenderEntity.female:
      return 'female';
  }
}

UserWeightGoalEntity mapUserWeightGoalStringToEntity(String goal) {
  switch (goal) {
    case 'loseWeight':
      return UserWeightGoalEntity.loseWeight;
    case 'gainWeight':
      return UserWeightGoalEntity.gainWeight;
    default:
      return UserWeightGoalEntity.maintainWeight;
  }
}

String mapUserWeightGoalEntityToString(UserWeightGoalEntity entity) {
  switch (entity) {
    case UserWeightGoalEntity.loseWeight:
      return 'loseWeight';
    case UserWeightGoalEntity.maintainWeight:
      return 'maintainWeight';
    case UserWeightGoalEntity.gainWeight:
      return 'gainWeight';
  }
}

UserPALEntity mapUserPALStringToEntity(String pal) {
  switch (pal) {
    case 'sedentary':
      return UserPALEntity.sedentary;
    case 'lowActive':
      return UserPALEntity.lowActive;
    case 'active':
      return UserPALEntity.active;
    case 'extraActive':
      return UserPALEntity.extraActive;
    default:
      return UserPALEntity.veryActive;
  }
}

String mapUserPALEntityToString(UserPALEntity entity) {
  switch (entity) {
    case UserPALEntity.sedentary:
      return 'sedentary';
    case UserPALEntity.lowActive:
      return 'lowActive';
    case UserPALEntity.active:
      return 'active';
    case UserPALEntity.veryActive:
      return 'veryActive';
    case UserPALEntity.extraActive:
      return 'extraActive';
  }
}

TDEEMethodEntity mapTDEEMethodStringToEntity(String method) {
  switch (method) {
    case 'mifflinStJeor':
      return TDEEMethodEntity.mifflinStJeor;
    default:
      return TDEEMethodEntity.iom2005;
  }
}

String mapTDEEMethodEntityToString(TDEEMethodEntity entity) {
  switch (entity) {
    case TDEEMethodEntity.iom2005:
      return 'iom2005';
    case TDEEMethodEntity.mifflinStJeor:
      return 'mifflinStJeor';
  }
}

ExerciseCalorieModeEntity mapExerciseCalorieModeStringToEntity(String mode) {
  switch (mode) {
    case 'none':
      return ExerciseCalorieModeEntity.none;
    case 'full':
      return ExerciseCalorieModeEntity.full;
    case 'custom':
      return ExerciseCalorieModeEntity.custom;
    default:
      return ExerciseCalorieModeEntity.half;
  }
}

String mapExerciseCalorieModeEntityToString(ExerciseCalorieModeEntity entity) {
  switch (entity) {
    case ExerciseCalorieModeEntity.none:
      return 'none';
    case ExerciseCalorieModeEntity.half:
      return 'half';
    case ExerciseCalorieModeEntity.full:
      return 'full';
    case ExerciseCalorieModeEntity.custom:
      return 'custom';
  }
}

UserEntity mapUserToEntity(User user) => UserEntity(
      birthday: user.birthday,
      heightCM: user.heightCM,
      weightKG: user.weightKG,
      gender: mapUserGenderStringToEntity(user.gender),
      goal: mapUserWeightGoalStringToEntity(user.goal),
      pal: mapUserPALStringToEntity(user.pal),
    );

UsersCompanion mapUserEntityToCompanion(UserEntity entity) => UsersCompanion(
      birthday: Value(entity.birthday),
      heightCM: Value(entity.heightCM),
      weightKG: Value(entity.weightKG),
      gender: Value(mapUserGenderEntityToString(entity.gender)),
      goal: Value(mapUserWeightGoalEntityToString(entity.goal)),
      pal: Value(mapUserPALEntityToString(entity.pal)),
    );