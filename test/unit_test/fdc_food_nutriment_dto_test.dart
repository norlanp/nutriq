import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_nutriment_dto.dart';

void main() {
  test('parses the FDC search nutrient shape (nutrientId/value)', () {
    final dto = FDCFoodNutrimentDTO.fromJson({
      'nutrientId': 1008,
      'nutrientName': 'Energy',
      'value': 516.0,
      'unitName': 'KCAL',
    });

    expect(dto.nutrientId, 1008);
    expect(dto.amount, 516.0);
  });
}
