import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/presentation/widgets/meal_value_unit_text.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/meal_item_card.dart';

void main() {
  testWidgets('does not render an invalid external package weight',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MealItemCard(
              day: DateTime(2026),
              mealEntity: MealEntity(
                code: '1',
                name: 'Test food',
                url: null,
                mealQuantity: 'varies by package',
                mealUnit: 'g',
                servingQuantity: null,
                servingUnit: 'g',
                servingSize: null,
                nutriments: MealNutrimentsEntity.empty(),
                source: MealSourceEntity.fdc,
              ),
              addMealType: AddMealType.breakfastType,
              usesImperialUnits: false,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(MealValueUnitText), findsNothing);
  });
}
