import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/config_table.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';

AppThemeEntity mapAppThemeStringToEntity(String theme) {
  switch (theme) {
    case 'light':
      return AppThemeEntity.light;
    case 'dark':
      return AppThemeEntity.dark;
    default:
      return AppThemeEntity.system;
  }
}

String mapAppThemeEntityToString(AppThemeEntity entity) {
  switch (entity) {
    case AppThemeEntity.light:
      return 'light';
    case AppThemeEntity.dark:
      return 'dark';
    case AppThemeEntity.system:
      return 'system';
  }
}

ConfigEntity mapConfigEntryToEntity(ConfigEntry entry) => ConfigEntity(
      entry.hasAcceptedDisclaimer,
      entry.hasAcceptedPolicy,
      entry.hasAcceptedSendAnonymousData,
      mapAppThemeStringToEntity(entry.selectedAppTheme),
      usesImperialUnits: entry.usesImperialUnits ?? false,
      userKcalAdjustment: entry.userKcalAdjustment,
      userCarbGoalPct: entry.userCarbGoalPct,
      userProteinGoalPct: entry.userProteinGoalPct,
      userFatGoalPct: entry.userFatGoalPct,
    );

ConfigEntriesCompanion mapConfigEntityToCompanion(ConfigEntity entity) =>
    ConfigEntriesCompanion(
      id: Value(ConfigEntries.defaultId),
      hasAcceptedDisclaimer: Value(entity.hasAcceptedDisclaimer),
      hasAcceptedPolicy: Value(entity.hasAcceptedPolicy),
      hasAcceptedSendAnonymousData: Value(entity.hasAcceptedSendAnonymousData),
      selectedAppTheme: Value(mapAppThemeEntityToString(entity.appTheme)),
      usesImperialUnits: Value(entity.usesImperialUnits),
      userKcalAdjustment: Value(entity.userKcalAdjustment),
      userCarbGoalPct: Value(entity.userCarbGoalPct),
      userProteinGoalPct: Value(entity.userProteinGoalPct),
      userFatGoalPct: Value(entity.userFatGoalPct),
    );

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

IntakeTypeEntity mapIntakeTypeStringToEntity(String type) {
  switch (type) {
    case 'breakfast':
      return IntakeTypeEntity.breakfast;
    case 'lunch':
      return IntakeTypeEntity.lunch;
    case 'dinner':
      return IntakeTypeEntity.dinner;
    default:
      return IntakeTypeEntity.snack;
  }
}

String mapIntakeTypeEntityToString(IntakeTypeEntity entity) {
  switch (entity) {
    case IntakeTypeEntity.breakfast:
      return 'breakfast';
    case IntakeTypeEntity.lunch:
      return 'lunch';
    case IntakeTypeEntity.dinner:
      return 'dinner';
    case IntakeTypeEntity.snack:
      return 'snack';
  }
}

MealSourceEntity mapMealSourceStringToEntity(String source) {
  switch (source) {
    case 'custom':
      return MealSourceEntity.custom;
    case 'off':
      return MealSourceEntity.off;
    case 'fdc':
      return MealSourceEntity.fdc;
    default:
      return MealSourceEntity.unknown;
  }
}

String mapMealSourceEntityToString(MealSourceEntity entity) {
  switch (entity) {
    case MealSourceEntity.unknown:
      return 'unknown';
    case MealSourceEntity.custom:
      return 'custom';
    case MealSourceEntity.off:
      return 'off';
    case MealSourceEntity.fdc:
      return 'fdc';
  }
}

MealNutrimentsEntity mapMealToNutrimentsEntity(Meal meal) =>
    MealNutrimentsEntity(
      energyKcal100: meal.energyKcal100,
      carbohydrates100: meal.carbohydrates100,
      fat100: meal.fat100,
      proteins100: meal.proteins100,
      sugars100: meal.sugars100,
      saturatedFat100: meal.saturatedFat100,
      fiber100: meal.fiber100,
    );

MealEntity mapMealToEntity(Meal meal) => MealEntity(
      code: meal.code,
      name: meal.name,
      brands: meal.brands,
      thumbnailImageUrl: meal.thumbnailImageUrl,
      mainImageUrl: meal.mainImageUrl,
      url: meal.url,
      mealQuantity: meal.mealQuantity,
      mealUnit: meal.mealUnit,
      servingQuantity: meal.servingQuantity,
      servingUnit: meal.servingUnit,
      servingSize: meal.servingSize,
      nutriments: mapMealToNutrimentsEntity(meal),
      source: mapMealSourceStringToEntity(meal.source),
    );

MealsCompanion mapMealEntityToCompanion(MealEntity entity) => MealsCompanion(
      id: Value(entity.code ?? ''),
      code: Value(entity.code),
      name: Value(entity.name),
      brands: Value(entity.brands),
      thumbnailImageUrl: Value(entity.thumbnailImageUrl),
      mainImageUrl: Value(entity.mainImageUrl),
      url: Value(entity.url),
      mealQuantity: Value(entity.mealQuantity),
      mealUnit: Value(entity.mealUnit),
      servingQuantity: Value(entity.servingQuantity),
      servingUnit: Value(entity.servingUnit),
      servingSize: Value(entity.servingSize),
      source: Value(mapMealSourceEntityToString(entity.source)),
      energyKcal100: Value(entity.nutriments.energyKcal100),
      carbohydrates100: Value(entity.nutriments.carbohydrates100),
      fat100: Value(entity.nutriments.fat100),
      proteins100: Value(entity.nutriments.proteins100),
      sugars100: Value(entity.nutriments.sugars100),
      saturatedFat100: Value(entity.nutriments.saturatedFat100),
      fiber100: Value(entity.nutriments.fiber100),
    );

IntakeEntity mapIntakeToEntity(Intake intake, Meal meal) => IntakeEntity(
      id: intake.id,
      unit: intake.unit,
      amount: intake.amount,
      type: mapIntakeTypeStringToEntity(intake.type),
      meal: mapMealToEntity(meal),
      dateTime: intake.date,
    );

IntakesCompanion mapIntakeEntityToCompanion(IntakeEntity entity) =>
    IntakesCompanion(
      id: Value(entity.id),
      unit: Value(entity.unit),
      amount: Value(entity.amount),
      type: Value(mapIntakeTypeEntityToString(entity.type)),
      mealId: Value(entity.meal.code ?? ''),
      date: Value(entity.dateTime),
    );

TrackedDayEntity mapTrackedDayToEntity(TrackedDay entry) => TrackedDayEntity(
      day: entry.day,
      calorieGoal: entry.calorieGoal,
      caloriesTracked: entry.caloriesTracked,
      carbsGoal: entry.carbsGoal,
      carbsTracked: entry.carbsTracked,
      fatGoal: entry.fatGoal,
      fatTracked: entry.fatTracked,
      proteinGoal: entry.proteinGoal,
      proteinTracked: entry.proteinTracked,
    );

TrackedDaysCompanion mapTrackedDayEntityToCompanion(
  TrackedDayEntity entity,
) =>
    TrackedDaysCompanion(
      day: Value(entity.day),
      calorieGoal: Value(entity.calorieGoal),
      caloriesTracked: Value(entity.caloriesTracked),
      carbsGoal: Value(entity.carbsGoal),
      carbsTracked: Value(entity.carbsTracked),
      fatGoal: Value(entity.fatGoal),
      fatTracked: Value(entity.fatTracked),
      proteinGoal: Value(entity.proteinGoal),
      proteinTracked: Value(entity.proteinTracked),
    );

PhysicalActivityTypeEntity mapPhysicalActivityTypeStringToEntity(String type) {
  switch (type) {
    case 'bicycling':
      return PhysicalActivityTypeEntity.bicycling;
    case 'conditioningExercise':
      return PhysicalActivityTypeEntity.conditioningExercise;
    case 'dancing':
      return PhysicalActivityTypeEntity.dancing;
    case 'running':
      return PhysicalActivityTypeEntity.running;
    case 'waterActivities':
      return PhysicalActivityTypeEntity.waterActivities;
    case 'winterActivities':
      return PhysicalActivityTypeEntity.winterActivities;
    default:
      return PhysicalActivityTypeEntity.sport;
  }
}

String mapPhysicalActivityTypeEntityToString(
    PhysicalActivityTypeEntity entity) {
  switch (entity) {
    case PhysicalActivityTypeEntity.bicycling:
      return 'bicycling';
    case PhysicalActivityTypeEntity.conditioningExercise:
      return 'conditioningExercise';
    case PhysicalActivityTypeEntity.dancing:
      return 'dancing';
    case PhysicalActivityTypeEntity.running:
      return 'running';
    case PhysicalActivityTypeEntity.sport:
      return 'sport';
    case PhysicalActivityTypeEntity.waterActivities:
      return 'waterActivities';
    case PhysicalActivityTypeEntity.winterActivities:
      return 'winterActivities';
  }
}

PhysicalActivityEntity mapPhysicalActivityToEntity(
  String code,
  String specificActivity,
  String description,
  double mets,
  List<String> tags,
  String type,
) =>
    PhysicalActivityEntity(
      code,
      specificActivity,
      description,
      mets,
      tags,
      mapPhysicalActivityTypeStringToEntity(type),
    );

UserActivityEntity mapUserActivityToEntity(UserActivity ua) {
  final paEntity = PhysicalActivityEntity(
    ua.physicalActivityCode,
    '',
    '',
    0,
    [],
    PhysicalActivityTypeEntity.sport,
  );
  return UserActivityEntity(
    ua.id,
    ua.duration,
    ua.burnedKcal,
    ua.date,
    paEntity,
  );
}

UserActivitiesCompanion mapUserActivityEntityToCompanion(
  UserActivityEntity entity,
) =>
    UserActivitiesCompanion.insert(
      id: entity.id,
      duration: entity.duration,
      burnedKcal: entity.burnedKcal,
      date: entity.date,
      physicalActivityCode: entity.physicalActivityEntity.code,
    );

RecipesCompanion mapRecipeEntityToCompanion(RecipeEntity entity) =>
    RecipesCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      servings: Value(entity.servings),
      createdAt: Value(entity.createdAt),
      updatedAt: Value(entity.updatedAt),
    );

RecipeItemsCompanion mapRecipeItemEntityToCompanion(RecipeItemEntity entity) =>
    RecipeItemsCompanion(
      id: Value(entity.id),
      recipeId: Value(entity.recipeId),
      mealId: Value(entity.meal.code ?? ''),
      amount: Value(entity.amount),
      unit: Value(entity.unit),
    );

RecipeEntity mapRecipeToEntity(Recipe recipe, List<RecipeItemEntity> items) =>
    RecipeEntity(
      id: recipe.id,
      name: recipe.name,
      servings: recipe.servings,
      createdAt: recipe.createdAt,
      updatedAt: recipe.updatedAt,
      items: items,
    );

RecipeItemEntity mapRecipeItemToEntity(RecipeItem item, MealEntity meal) =>
    RecipeItemEntity(
      id: item.id,
      recipeId: item.recipeId,
      meal: meal,
      amount: item.amount,
      unit: item.unit,
    );
