import 'package:nutriq/features/add_meal/data/data_sources/fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class ProductsRepository {
  final OFFDataSource _offDataSource;
  final FDCDataSource _fdcDataSource;

  ProductsRepository(this._offDataSource, this._fdcDataSource);

  Future<List<MealEntity>> getOFFProductsByString(String searchString) async {
    return _offDataSource.searchProducts(searchString);
  }

  Future<List<MealEntity>> getFDCFoodsByString(String searchString) async {
    final fdcWordResponse =
        await _fdcDataSource.fetchSearchWordResults(searchString);
    final products = fdcWordResponse.foods
        .map((food) => MealEntity.fromFDCFood(food))
        .toList();
    return products;
  }

  Future<MealEntity> getOFFProductByBarcode(String barcode) async {
    return _offDataSource.getProductByBarcode(barcode);
  }
}
