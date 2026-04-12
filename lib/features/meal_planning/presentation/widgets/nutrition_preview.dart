import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class NutritionPreview extends StatelessWidget {
  final List<MealPlanEntity> plans;

  const NutritionPreview({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    final totalKcal = plans.fold<double>(0, (sum, _) => sum + 0);
    final totalCarbs = plans.fold<double>(0, (sum, _) => sum + 0);
    final totalFat = plans.fold<double>(0, (sum, _) => sum + 0);
    final totalProtein = plans.fold<double>(0, (sum, _) => sum + 0);

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).nutritionPreviewLabel,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _macroChip(context, S.of(context).kcalLabel,
                    totalKcal.toStringAsFixed(0)),
                _macroChip(context, S.of(context).carbsLabel,
                    '${totalCarbs.toStringAsFixed(0)}g'),
                _macroChip(context, S.of(context).fatLabel,
                    '${totalFat.toStringAsFixed(0)}g'),
                _macroChip(context, S.of(context).proteinLabel,
                    '${totalProtein.toStringAsFixed(0)}g'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _macroChip(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
