import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/presentation/widgets/macro_pie_chart.dart';
import 'package:nutriq/core/presentation/widgets/micro_nutrient_progress.dart';
import 'package:nutriq/generated/l10n.dart';

class DailyNutritionSummary extends StatelessWidget {
  final TrackedDayEntity? trackedDay;
  final List<IntakeEntity> intakes;

  const DailyNutritionSummary({
    super.key,
    required this.trackedDay,
    required this.intakes,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final totalKcal = intakes.fold(0.0, (sum, i) => sum + i.totalKcal);
    final totalCarbs = intakes.fold(0.0, (sum, i) => sum + i.totalCarbsGram);
    final totalFats = intakes.fold(0.0, (sum, i) => sum + i.totalFatsGram);
    final totalProteins =
        intakes.fold(0.0, (sum, i) => sum + i.totalProteinsGram);

    final calorieGoal = trackedDay?.calorieGoal ?? 0;
    final carbsGoal = trackedDay?.carbsGoal ?? 0;
    final fatsGoal = trackedDay?.fatGoal ?? 0;
    final proteinsGoal = trackedDay?.proteinGoal ?? 0;

    final microPercentages = _aggregateMicroNutrients(intakes);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.dailySummaryLabel,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Center(
              child: MacroPieChart(
                carbsGram: totalCarbs,
                fatsGram: totalFats,
                proteinsGram: totalProteins,
                calorieGoal: calorieGoal,
                caloriesConsumed: totalKcal,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            _MacroBreakdownRow(
              label: l10n.carbsLabel,
              consumedGram: totalCarbs,
              goalGram: carbsGoal,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 4),
            _MacroBreakdownRow(
              label: l10n.fatLabel,
              consumedGram: totalFats,
              goalGram: fatsGoal,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(height: 4),
            _MacroBreakdownRow(
              label: l10n.proteinLabel,
              consumedGram: totalProteins,
              goalGram: proteinsGoal,
              color: Theme.of(context).colorScheme.error,
            ),
            if (microPercentages.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                l10n.microNutrientsLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              MicroNutrientProgress(
                microNutrientPercentages: microPercentages,
                maxVisible: 4,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Map<String, double> _aggregateMicroNutrients(List<IntakeEntity> intakes) {
    final Map<String, double> aggregated = {};

    for (final intake in intakes) {
      final micros = intake.meal.nutriments.getMicroNutrientPercentages();
      for (final entry in micros.entries) {
        // Scale by amount (nutriments are per 100g/ml)
        final scaled = entry.value * intake.amount;
        aggregated[entry.key] = (aggregated[entry.key] ?? 0) + scaled;
      }
    }

    return aggregated;
  }
}

class _MacroBreakdownRow extends StatelessWidget {
  final String label;
  final double consumedGram;
  final double goalGram;
  final Color color;

  const _MacroBreakdownRow({
    required this.label,
    required this.consumedGram,
    required this.goalGram,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final pct = goalGram > 0 ? (consumedGram / goalGram * 100) : 0.0;

    return Row(
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
          ),
        ),
        Expanded(
          child: Text(
            '${consumedGram.toInt()}/${goalGram.toInt()}g',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 48,
          child: Text(
            '${pct.toInt()}%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: pct > 100
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.6),
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
