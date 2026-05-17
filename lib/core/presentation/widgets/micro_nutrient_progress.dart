import 'package:flutter/material.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/generated/l10n.dart';

class MicroNutrientProgress extends StatelessWidget {
  final Map<String, double> microNutrientPercentages;
  final int maxVisible;
  final bool expanded;

  const MicroNutrientProgress({
    super.key,
    required this.microNutrientPercentages,
    this.maxVisible = 6,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final entries = microNutrientPercentages.entries.toList();
    final visibleEntries =
        expanded ? entries : entries.take(maxVisible).toList();
    final hasMore = entries.length > maxVisible;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in visibleEntries)
          _MicroNutrientRow(
            name: _getLocalizedName(context, entry.key),
            percentage: entry.value,
          ),
        if (hasMore && !expanded)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              S.of(context).seeAllLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
      ],
    );
  }

  String _getLocalizedName(BuildContext context, String key) {
    final l10n = S.of(context);
    switch (key) {
      case 'fiber':
        return l10n.fiberLabel;
      case 'sugar':
        return l10n.sugarLabel;
      case 'sodium':
        return 'Sodium';
      case 'potassium':
        return 'Potassium';
      case 'cholesterol':
        return 'Cholesterol';
      case 'vitaminA':
        return 'Vitamin A';
      case 'vitaminC':
        return 'Vitamin C';
      case 'vitaminD':
        return 'Vitamin D';
      case 'calcium':
        return 'Calcium';
      case 'iron':
        return 'Iron';
      default:
        return key;
    }
  }
}

class _MicroNutrientRow extends StatelessWidget {
  final String name;
  final double percentage;

  const _MicroNutrientRow({
    required this.name,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final clampedPct = percentage.clamp(0.0, 150.0);
    final displayPct = percentage.clamp(0.0, double.infinity);
    final barWidth = (clampedPct / 100.0).clamp(0.0, 1.0);
    final color = _getColor(context, percentage);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: barWidth,
                minHeight: 8,
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            child: Text(
              '${displayPct.toInt()}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(BuildContext context, double pct) {
    if (pct <= 100) return context.nutriqColors.warning;
    return context.nutriqColors.success;
  }
}
