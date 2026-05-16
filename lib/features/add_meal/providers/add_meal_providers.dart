import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';

final searchProductsUseCaseProvider = Provider((ref) {
  return SearchProductsUseCase(ref.watch(productsRepositoryProvider));
});

final searchProductByBarcodeUseCaseProvider = Provider((ref) {
  return SearchProductByBarcodeUseCase(ref.watch(productsRepositoryProvider));
});

final groceryCheckServiceProvider = Provider((ref) {
  return GroceryCheckService(ref.watch(searchProductByBarcodeUseCaseProvider));
});