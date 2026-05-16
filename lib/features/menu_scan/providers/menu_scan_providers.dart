import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/add_meal/providers/add_meal_providers.dart';
import 'package:nutriq/features/menu_scan/domain/usecase/scan_menu_usecase.dart';

final scanMenuUsecaseProvider = Provider((ref) {
  return ScanMenuUsecase(
    ref.watch(menuScannerServiceProvider),
    ref.watch(menuItemParserServiceProvider),
    ref.watch(searchProductsUseCaseProvider),
  );
});