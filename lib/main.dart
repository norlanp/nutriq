import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/presentation/main_screen.dart';
import 'package:nutriq/core/presentation/widgets/image_full_screen.dart';
import 'package:nutriq/core/styles/color_schemes.dart';
import 'package:nutriq/core/styles/fonts.dart';
import 'package:nutriq/core/utils/env.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/core/utils/logger_config.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/core/utils/theme_mode_provider.dart';
import 'package:home_widget/home_widget.dart';
import 'package:nutriq/features/activity_detail/activity_detail_screen.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_screen.dart';
import 'package:nutriq/features/add_meal/presentation/custom_food_screen.dart';
import 'package:nutriq/features/add_activity/presentation/add_activity_screen.dart';
import 'package:nutriq/features/edit_meal/presentation/edit_meal_screen.dart';
import 'package:nutriq/features/onboarding/onboarding_screen.dart';
import 'package:nutriq/features/scanner/scanner_screen.dart';
import 'package:nutriq/features/meal_detail/meal_detail_screen.dart';
import 'package:nutriq/features/recipe_builder/presentation/recipe_builder_screen.dart';
import 'package:nutriq/features/recipe_builder/presentation/recipe_list_screen.dart';
import 'package:nutriq/features/settings/settings_screen.dart';
import 'package:nutriq/features/settings/presentation/allergen_settings_screen.dart';
import 'package:nutriq/features/weight_tracking/presentation/screen/weight_tracking_screen.dart';
import 'package:nutriq/features/notifications/presentation/notification_settings_screen.dart';
import 'package:nutriq/features/water_tracking/presentation/screen/water_tracker_screen.dart';
import 'package:nutriq/features/progress_charts/presentation/progress_charts_screen.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_timer_screen.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_history_screen.dart';
import 'package:nutriq/features/health_sync/presentation/health_sync_screen.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_screen.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_screen.dart';
import 'package:nutriq/features/meal_planning/presentation/shopping_list_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_capture_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_comparison_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_timeline_screen.dart';
import 'package:nutriq/features/data_sync/presentation/export_screen.dart';
import 'package:nutriq/features/data_sync/presentation/import_screen.dart';
import 'package:nutriq/features/data_sync/presentation/cloud_backup_settings_screen.dart';
import 'package:nutriq/features/meal_timing/presentation/meal_timing_screen.dart';
import 'package:nutriq/features/body_measurements/presentation/screen/body_measurement_screen.dart';
import 'package:nutriq/features/recipe_import/presentation/recipe_import_screen.dart';
import 'package:nutriq/features/symptom_tracking/presentation/symptom_screen.dart';
import 'package:nutriq/features/blood_glucose/presentation/blood_glucose_screen.dart';
import 'package:nutriq/features/medication/presentation/medication_screen.dart';
import 'package:nutriq/features/medication/presentation/medication_log_screen.dart';
import 'package:nutriq/features/recipe_catalog/presentation/recipe_catalog_screen.dart';
import 'package:nutriq/features/recipe_catalog/presentation/recipe_detail_screen.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_scan_screen.dart';
import 'package:nutriq/features/voice_logging/presentation/voice_logging_screen.dart';
import 'package:nutriq/features/grocery_check/presentation/grocery_check_screen.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide ChangeNotifierProvider, Provider;
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    LoggerConfig.intiLogger();
    final log = Logger('main');

    FlutterError.onError = (details) {
      log.severe('FlutterError', details.exception, details.stack);
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      FlutterError.presentError(details);
    };

    await initLocator();

    try {
      await HomeWidget.setAppGroupId('group.com.nutriq.app');
    } catch (_) {}

    final isUserInitialized = await locator<UserDataSource>().hasUserData();
    final configRepo = locator<ConfigRepository>();
    final hasAcceptedAnonymousData =
        await configRepo.getConfigHasAcceptedAnonymousData();
    final savedAppTheme = await configRepo.getConfigAppTheme();

    // If the user has accepted anonymous data collection, run the app with
    // sentry enabled, else run without it
    if (kReleaseMode && hasAcceptedAnonymousData) {
      log.info('Starting App with Sentry enabled ...');
      _runAppWithSentryReporting(isUserInitialized, savedAppTheme);
    } else {
      log.info('Starting App ...');
      runAppWithChangeNotifiers(isUserInitialized, savedAppTheme);
    }
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    print('UNCAUGHT ERROR: $error');
    print('STACK: $stack');
  });
}

void _runAppWithSentryReporting(
    bool isUserInitialized, AppThemeEntity savedAppTheme) async {
  await SentryFlutter.init((options) {
    options.dsn = Env.sentryDns;
    options.tracesSampleRate = 1.0;
  },
      appRunner: () =>
          runAppWithChangeNotifiers(isUserInitialized, savedAppTheme));
}

void runAppWithChangeNotifiers(
        bool userInitialized, AppThemeEntity savedAppTheme) =>
    runApp(ProviderScope(
        child: ChangeNotifierProvider(
            create: (_) => ThemeModeProvider(appTheme: savedAppTheme),
            child: NutriqApp(userInitialized: userInitialized))));

class NutriqApp extends StatelessWidget {
  final bool userInitialized;

  const NutriqApp({super.key, required this.userInitialized});

  @override
  Widget build(BuildContext context) {
    final platformLocale = ui.PlatformDispatcher.instance.locale;
    final locale = (platformLocale.languageCode == 'undefined' ||
            platformLocale.toString() == 'undefined')
        ? const Locale('en')
        : platformLocale;
    return MaterialApp(
      locale: locale,
      onGenerateTitle: (context) => S.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: appTextTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: appTextTheme),
      themeMode: Provider.of<ThemeModeProvider>(context).themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supported) {
        if (locale == null ||
            locale.languageCode == 'undefined' ||
            locale.toString() == 'undefined') {
          return const Locale('en');
        }
        for (final supportedLocale in supported) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return const Locale('en');
      },
      initialRoute: userInitialized
          ? NavigationOptions.mainRoute
          : NavigationOptions.onboardingRoute,
      routes: {
        NavigationOptions.mainRoute: (context) => const MainScreen(),
        NavigationOptions.onboardingRoute: (context) =>
            const OnboardingScreen(),
        NavigationOptions.settingsRoute: (context) => const SettingsScreen(),
        NavigationOptions.addMealRoute: (context) => const AddMealScreen(),
        NavigationOptions.scannerRoute: (context) => const ScannerScreen(),
        NavigationOptions.mealDetailRoute: (context) =>
            const MealDetailScreen(),
        NavigationOptions.editMealRoute: (context) => const EditMealScreen(),
        NavigationOptions.addActivityRoute: (context) =>
            const AddActivityScreen(),
        NavigationOptions.activityDetailRoute: (context) =>
            const ActivityDetailScreen(),
        NavigationOptions.imageFullScreenRoute: (context) =>
            const ImageFullScreen(),
        NavigationOptions.recipeListRoute: (context) =>
            const RecipeListScreen(),
        NavigationOptions.recipeBuilderRoute: (context) =>
            const RecipeBuilderScreen(),
        NavigationOptions.weightTrackingRoute: (context) =>
            const WeightTrackingScreen(),
        NavigationOptions.notificationSettingsRoute: (context) =>
            const NotificationSettingsScreen(),
        NavigationOptions.waterTrackingRoute: (context) =>
            const WaterTrackerScreen(),
        NavigationOptions.progressChartsRoute: (context) =>
            const ProgressChartsScreen(),
        NavigationOptions.fastingTrackerRoute: (context) =>
            const FastingTimerScreen(),
        NavigationOptions.fastingHistoryRoute: (context) =>
            const FastingHistoryScreen(),
        NavigationOptions.healthSyncRoute: (context) =>
            const HealthSyncScreen(),
        NavigationOptions.aiScannerRoute: (context) => const AiScannerScreen(),
        NavigationOptions.mealPlanRoute: (context) => const MealPlanScreen(),
        NavigationOptions.shoppingListRoute: (context) =>
            const ShoppingListScreen(),
        NavigationOptions.photoProgressRoute: (context) =>
            const PhotoTimelineScreen(),
        NavigationOptions.photoCaptureRoute: (context) =>
            const PhotoCaptureScreen(),
        NavigationOptions.photoComparisonRoute: (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return PhotoComparisonScreen(
            beforePhoto: args['beforePhoto'],
            afterPhoto: args['afterPhoto'],
          );
        },
        NavigationOptions.exportRoute: (context) => const ExportScreen(),
        NavigationOptions.importRoute: (context) => const ImportScreen(),
        NavigationOptions.cloudBackupRoute: (context) =>
            const CloudBackupSettingsScreen(),
        NavigationOptions.mealTimingRoute: (context) =>
            const MealTimingScreen(),
        NavigationOptions.bodyMeasurementRoute: (context) =>
            const BodyMeasurementScreen(),
        NavigationOptions.customFoodRoute: (context) =>
            const CustomFoodScreen(),
        NavigationOptions.symptomTrackingRoute: (context) =>
            const SymptomTrackingScreen(),
        NavigationOptions.recipeImportRoute: (context) =>
            const RecipeImportScreen(),
        NavigationOptions.bloodGlucoseRoute: (context) =>
            const BloodGlucoseScreen(),
        NavigationOptions.allergenSettingsRoute: (context) =>
            const AllergenSettingsScreen(),
        NavigationOptions.medicationRoute: (context) =>
            const MedicationScreen(),
        NavigationOptions.medicationLogRoute: (context) =>
            const MedicationLogScreen(),
        NavigationOptions.recipeCatalogRoute: (context) =>
            const RecipeCatalogScreen(),
        NavigationOptions.recipeCatalogDetailRoute: (context) {
          final recipeId = ModalRoute.of(context)!.settings.arguments as String;
          return RecipeDetailScreen(recipeId: recipeId);
        },
        NavigationOptions.menuScanRoute: (context) => const MenuScanScreen(),
        NavigationOptions.voiceLoggingRoute: (context) =>
            const VoiceLoggingScreen(),
        NavigationOptions.groceryCheckRoute: (context) =>
            const GroceryCheckScreen(),
      },
    );
  }
}
