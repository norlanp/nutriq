import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nutriq/core/data/data_source/config_data_source.dart';
import 'package:nutriq/core/data/data_source/intake_data_source.dart';
import 'package:nutriq/core/data/data_source/physical_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/recipe_data_source.dart';
import 'package:nutriq/core/data/data_source/tracked_day_data_source.dart';
import 'package:nutriq/core/data/data_source/user_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/repository/config_repository.dart' as data;
import 'package:nutriq/core/domain/repository/config_repository.dart' as domain;
import 'package:nutriq/core/data/repository/intake_repository.dart';
import 'package:nutriq/core/data/repository/physical_activity_repository.dart';
import 'package:nutriq/core/data/repository/recipe_repository.dart';
import 'package:nutriq/core/data/repository/tracked_day_repository.dart';
import 'package:nutriq/core/data/repository/user_activity_repository.dart';
import 'package:nutriq/core/data/repository/user_repository.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_user_activity_usercase.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_physical_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/update_intake_usecase.dart';
import 'package:nutriq/core/utils/env.dart';
import 'package:nutriq/core/utils/ont_image_cache_manager.dart';
import 'package:nutriq/features/activity_detail/presentation/bloc/activity_detail_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/activities_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/recent_activities_bloc.dart';
import 'package:nutriq/features/add_meal/data/data_sources/fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/sp_fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/add_meal_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/food_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/products_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/recent_meal_bloc.dart';
import 'package:nutriq/features/diary/presentation/bloc/calendar_day_bloc.dart';
import 'package:nutriq/features/diary/presentation/bloc/diary_bloc.dart';
import 'package:nutriq/features/edit_meal/presentation/bloc/edit_meal_bloc.dart';
import 'package:nutriq/features/home/presentation/bloc/home_bloc.dart';
import 'package:nutriq/features/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:nutriq/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:nutriq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart'
    as recipe_domain;
import 'package:nutriq/features/recipe_builder/domain/usecase/add_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/delete_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/get_recipes_usecase.dart';
import 'package:nutriq/features/recipe_builder/presentation/bloc/recipe_bloc.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';
import 'package:nutriq/features/scanner/presentation/scanner_bloc.dart';
import 'package:nutriq/features/settings/domain/usecase/export_data_usecase.dart';
import 'package:nutriq/features/settings/domain/usecase/import_data_usecase.dart';
import 'package:nutriq/features/settings/presentation/bloc/export_import_bloc.dart';
import 'package:nutriq/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  final appDatabase = AppDatabase();

  await Supabase.initialize(
    url: Env.supabaseProjectUrl,
    anonKey: Env.supabaseProjectAnonKey,
  );
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  locator.registerLazySingleton<CacheManager>(
    () => OntImageCacheManager.instance,
  );

  // DataSources
  final configDao = appDatabase.configDao;
  final userDao = appDatabase.userDao;
  final intakeDao = appDatabase.intakeDao;
  final mealDao = MealDao(appDatabase);
  final recipeDao = RecipeDao(appDatabase);
  final userActivityDao = appDatabase.userActivityDao;
  final trackedDayDao = appDatabase.trackedDayDao;

  locator.registerLazySingleton(
    () => ConfigDataSource(configDao),
  );
  locator.registerLazySingleton<UserDataSource>(
    () => UserDataSource(userDao),
  );
  locator.registerLazySingleton<IntakeDataSource>(
    () => IntakeDataSource(intakeDao),
  );
  locator.registerLazySingleton<UserActivityDataSource>(
    () => UserActivityDataSource(userActivityDao),
  );
  locator.registerLazySingleton<PhysicalActivityDataSource>(
    () => PhysicalActivityDataSource(),
  );
  locator.registerLazySingleton<OFFDataSource>(() => OFFDataSource());
  locator.registerLazySingleton<FDCDataSource>(() => FDCDataSource());
  locator.registerLazySingleton<SpFdcDataSource>(() => SpFdcDataSource());
  locator.registerLazySingleton(
    () => TrackedDayDataSource(trackedDayDao),
  );
  locator.registerLazySingleton<MealDao>(() => mealDao);
  locator.registerLazySingleton<RecipeDao>(() => recipeDao);

  locator.registerLazySingleton<RecipeDataSource>(
    () => RecipeDataSource(recipeDao),
  );

  // Repositories
  locator.registerLazySingleton<domain.ConfigRepository>(
    () => data.ConfigRepository(locator()),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepository(locator()),
  );
  locator.registerLazySingleton<IntakeRepository>(
    () => IntakeRepository(locator(), locator()),
  );
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(locator(), locator(), locator()),
  );
  locator.registerLazySingleton<UserActivityRepository>(
    () => UserActivityRepository(locator()),
  );
  locator.registerLazySingleton<PhysicalActivityRepository>(
    () => PhysicalActivityRepository(locator()),
  );
  locator.registerLazySingleton<TrackedDayRepository>(
    () => TrackedDayRepository(locator()),
  );
  locator.registerLazySingleton<recipe_domain.RecipeRepository>(
    () => RecipeRepository(locator(), locator()),
  );

  // UseCases
  locator.registerLazySingleton<GetConfigUsecase>(
    () => GetConfigUsecase(locator()),
  );
  locator.registerLazySingleton<AddConfigUsecase>(
    () => AddConfigUsecase(locator()),
  );
  locator.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(locator()),
  );
  locator.registerLazySingleton<AddUserUsecase>(
    () => AddUserUsecase(locator()),
  );
  locator.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(locator()),
  );
  locator.registerLazySingleton<SearchProductByBarcodeUseCase>(
    () => SearchProductByBarcodeUseCase(locator()),
  );
  locator.registerLazySingleton<GetIntakeUsecase>(
    () => GetIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<AddIntakeUsecase>(
    () => AddIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteIntakeUsecase>(
    () => DeleteIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<UpdateIntakeUsecase>(
    () => UpdateIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<GetUserActivityUsecase>(
    () => GetUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<AddUserActivityUsecase>(
    () => AddUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteUserActivityUsecase>(
    () => DeleteUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<GetPhysicalActivityUsecase>(
    () => GetPhysicalActivityUsecase(locator()),
  );
  locator.registerLazySingleton<GetTrackedDayUsecase>(
    () => GetTrackedDayUsecase(locator()),
  );
  locator.registerLazySingleton<AddTrackedDayUsecase>(
    () => AddTrackedDayUsecase(locator()),
  );
  locator.registerLazySingleton(
    () => GetKcalGoalUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton(() => GetMacroGoalUsecase(locator()));
  locator.registerLazySingleton(
    () => ExportDataUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton(
    () => ImportDataUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton<GetRecipesUsecase>(
    () => GetRecipesUsecase(locator()),
  );
  locator.registerLazySingleton<AddRecipeUsecase>(
    () => AddRecipeUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteRecipeUsecase>(
    () => DeleteRecipeUsecase(locator()),
  );

  // BLoCs
  locator.registerLazySingleton<OnboardingBloc>(
    () => OnboardingBloc(locator(), locator()),
  );
  locator.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerLazySingleton(() => DiaryBloc(locator(), locator()));
  locator.registerLazySingleton(
    () => CalendarDayBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(locator(), locator(), locator(), locator(), locator()),
  );
  locator.registerLazySingleton(
    () => SettingsBloc(locator(), locator(), locator(), locator(), locator()),
  );
  locator.registerFactory(() => ExportImportBloc(locator(), locator()));

  locator.registerFactory<ActivitiesBloc>(() => ActivitiesBloc(locator()));
  locator.registerFactory<RecentActivitiesBloc>(
    () => RecentActivitiesBloc(locator()),
  );
  locator.registerFactory<ActivityDetailBloc>(
    () => ActivityDetailBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<MealDetailBloc>(
    () => MealDetailBloc(locator(), locator(), locator(), locator()),
  );
  locator.registerFactory<ScannerBloc>(() => ScannerBloc(locator(), locator()));
  locator.registerFactory<EditMealBloc>(() => EditMealBloc(locator()));
  locator.registerFactory<AddMealBloc>(() => AddMealBloc(locator()));
  locator.registerFactory<ProductsBloc>(
    () => ProductsBloc(locator(), locator()),
  );
  locator.registerFactory<FoodBloc>(() => FoodBloc(locator(), locator()));
  locator.registerFactory(() => RecentMealBloc(locator(), locator()));
  locator.registerFactory<RecipeBloc>(
    () => RecipeBloc(locator(), locator(), locator()),
  );

  await _initializeConfig(locator<ConfigDataSource>());
}

Future<void> _initializeConfig(ConfigDataSource configDataSource) async {
  if (!await configDataSource.configInitialized()) {
    configDataSource.initializeConfig();
  }
}
