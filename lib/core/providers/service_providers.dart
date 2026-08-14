import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/service/allergen_filter_service.dart';
import 'package:nutriq/core/domain/service/autopilot_service.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/core/domain/service/food_grade_filter.dart';
import 'package:nutriq/core/domain/service/recipe_scraper_service.dart';
import 'package:nutriq/core/domain/service/widget_data_service.dart';
import 'package:nutriq/core/network/dio_provider.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/data/service/recipe_scraper_service_impl.dart';
import 'package:nutriq/features/ai_food_scanner/data/food_classifier_service.dart';
import 'package:nutriq/features/menu_scan/data/menu_item_parser_service.dart';
import 'package:nutriq/features/menu_scan/data/menu_scanner_service.dart';
import 'package:nutriq/features/voice_logging/data/food_parser_service.dart';
import 'package:nutriq/features/voice_logging/data/voice_logging_service.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/health_sync/data/platform_health_service_factory_io.dart'
    as health_factory;

import 'package:nutriq/core/utils/ont_image_cache_manager.dart';

final cacheManagerProvider = Provider<CacheManager>((ref) {
  return OntImageCacheManager.instance;
});

final recipeScraperServiceProvider = Provider<RecipeScraperService>((ref) {
  return RecipeScraperServiceImpl(ref.watch(dioProvider));
});

final autopilotServiceProvider = Provider<AutopilotServiceImpl>((ref) {
  return AutopilotServiceImpl();
});

final foodClassifierServiceProvider = Provider((ref) {
  final service = FoodClassifierService();
  ref.onDispose(service.dispose);
  return service;
});

final foodGradeCalculatorProvider = Provider((ref) => FoodGradeCalculator());

final allergenFilterServiceProvider = Provider(
  (ref) => AllergenFilterService(),
);

final foodGradeFilterProvider = Provider((ref) => FoodGradeFilter());

final menuScannerServiceProvider = Provider((ref) => MenuScannerService());

final menuItemParserServiceProvider = Provider(
  (ref) => MenuItemParserService(),
);

final voiceLoggingServiceProvider = Provider((ref) => VoiceLoggingService());

final foodParserServiceProvider = Provider((ref) {
  return FoodParserService(ref.watch(productsRepositoryProvider));
});

final healthSyncServiceProvider = Provider<HealthSyncService>((ref) {
  return health_factory.PlatformHealthServiceFactory.create();
});

final widgetDataServiceProvider = Provider((ref) => WidgetDataService());
