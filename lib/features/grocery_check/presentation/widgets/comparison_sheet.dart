import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/core/presentation/widgets/food_grade_badge.dart';
import 'package:nutriq/generated/l10n.dart';

class ComparisonSheet extends StatelessWidget {
  final List<GroceryCheckItem> items;

  const ComparisonSheet({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    if (items.length < 2) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: Text(s.groceryCheckSelectTwoHint)),
      );
    }

    final a = items[0];
    final b = items[1];
    final nA = a.product.nutriments;
    final nB = b.product.nutriments;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                s.groceryCheckComparisonTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: ComparisonHeader(item: a)),
                  const SizedBox(width: 8),
                  Expanded(child: ComparisonHeader(item: b)),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '${s.nutritionInfoLabel} (${s.groceryCheckPer100gml})',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ComparisonRow(
                label: s.caloriesLabel,
                unit: s.kcalLabel,
                valueA: nA.energyKcal100,
                valueB: nB.energyKcal100,
                lowerIsBetter: true,
              ),
              ComparisonRow(
                label: s.proteinLabel,
                unit: 'g',
                valueA: nA.proteins100,
                valueB: nB.proteins100,
                lowerIsBetter: false,
              ),
              ComparisonRow(
                label: s.carbohydrateLabel,
                unit: 'g',
                valueA: nA.carbohydrates100,
                valueB: nB.carbohydrates100,
                lowerIsBetter: true,
              ),
              ComparisonRow(
                label: s.sugarLabel,
                unit: 'g',
                valueA: nA.sugars100,
                valueB: nB.sugars100,
                lowerIsBetter: true,
              ),
              ComparisonRow(
                label: s.fiberLabel,
                unit: 'g',
                valueA: nA.fiber100,
                valueB: nB.fiber100,
                lowerIsBetter: false,
              ),
              ComparisonRow(
                label: s.fatLabel,
                unit: 'g',
                valueA: nA.fat100,
                valueB: nB.fat100,
                lowerIsBetter: true,
              ),
              ComparisonRow(
                label: s.saturatedFatLabel,
                unit: 'g',
                valueA: nA.saturatedFat100,
                valueB: nB.saturatedFat100,
                lowerIsBetter: true,
              ),
              ComparisonRow(
                label: s.sodiumLabel,
                unit: 'mg',
                valueA: nA.sodium100,
                valueB: nB.sodium100,
                lowerIsBetter: true,
              ),
              const SizedBox(height: 24),
              Center(
                child: WinnerBadge(gradeA: a.grade, gradeB: b.grade),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class ComparisonHeader extends StatelessWidget {
  final GroceryCheckItem item;

  const ComparisonHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        FoodGradeBadge(grade: item.grade, size: 40),
        const SizedBox(height: 4),
        Text(
          item.product.name ?? S.of(context).notAvailableLabel,
          style:
              theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ComparisonRow extends StatelessWidget {
  final String label;
  final String unit;
  final double? valueA;
  final double? valueB;
  final bool lowerIsBetter;

  const ComparisonRow({
    super.key,
    required this.label,
    required this.unit,
    required this.valueA,
    required this.valueB,
    required this.lowerIsBetter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final aWins = _aIsBetter();
    final bWins = _bIsBetter();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              valueA != null ? '${valueA!.toStringAsFixed(1)} $unit' : '-',
              textAlign: TextAlign.end,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: aWins ? FontWeight.bold : FontWeight.normal,
                color: aWins ? Colors.green : null,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              valueB != null ? '${valueB!.toStringAsFixed(1)} $unit' : '-',
              textAlign: TextAlign.start,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: bWins ? FontWeight.bold : FontWeight.normal,
                color: bWins ? Colors.green : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _aIsBetter() {
    if (valueA == null || valueB == null) return false;
    return lowerIsBetter ? valueA! < valueB! : valueA! > valueB!;
  }

  bool _bIsBetter() {
    if (valueA == null || valueB == null) return false;
    return lowerIsBetter ? valueB! < valueA! : valueB! > valueA!;
  }
}

class WinnerBadge extends StatelessWidget {
  final FoodGrade gradeA;
  final FoodGrade gradeB;

  const WinnerBadge({super.key, required this.gradeA, required this.gradeB});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    if (gradeA.index < gradeB.index) {
      return Chip(
        avatar: const Icon(Icons.emoji_events, size: 18),
        label: Text(s.groceryCheckWinner),
        backgroundColor: gradeA.color.withValues(alpha: 0.2),
      );
    } else if (gradeB.index < gradeA.index) {
      return Chip(
        avatar: const Icon(Icons.emoji_events, size: 18),
        label: Text(s.groceryCheckWinner),
        backgroundColor: gradeB.color.withValues(alpha: 0.2),
      );
    }

    return Chip(
      label: Text(
        '${s.foodGradeLabel}: ${gradeA.label} = ${gradeB.label}',
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}