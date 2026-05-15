import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';

class GroceryCheckItem {
  final String barcode;
  final MealEntity product;
  final FoodGrade grade;

  const GroceryCheckItem({
    required this.barcode,
    required this.product,
    required this.grade,
  });

  GroceryCheckItem copyWith({
    String? barcode,
    MealEntity? product,
    FoodGrade? grade,
  }) {
    return GroceryCheckItem(
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      grade: grade ?? this.grade,
    );
  }
}

class GroceryCheckService {
  final SearchProductByBarcodeUseCase _searchProductUseCase;

  GroceryCheckService(this._searchProductUseCase);

  Future<GroceryCheckItem> scanBarcode(String barcode) async {
    final product = await _searchProductUseCase.searchProductByBarcode(barcode);
    final grade = _computeGrade(product);
    return GroceryCheckItem(
      barcode: barcode,
      product: product,
      grade: grade,
    );
  }

  FoodGrade _computeGrade(MealEntity product) {
    final n = product.nutriments;
    return FoodGradeCalculator.calculate(
      calories: n.energyKcal100 ?? 0,
      proteinG: n.proteins100 ?? 0,
      fiberG: n.fiber100 ?? 0,
      sugarG: n.sugars100 ?? 0,
      sodiumMg: n.sodium100 ?? 0,
      totalFatG: n.fat100 ?? 0,
      saturatedFatG: n.saturatedFat100 ?? 0,
    );
  }
}
