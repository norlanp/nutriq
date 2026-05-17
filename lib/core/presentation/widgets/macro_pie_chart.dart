import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/generated/l10n.dart';

class MacroPieChart extends StatelessWidget {
  final double carbsGram;
  final double fatsGram;
  final double proteinsGram;
  final double calorieGoal;
  final double caloriesConsumed;

  const MacroPieChart({
    super.key,
    required this.carbsGram,
    required this.fatsGram,
    required this.proteinsGram,
    required this.calorieGoal,
    required this.caloriesConsumed,
  });

  @override
  Widget build(BuildContext context) {
    final totalMacroGrams = carbsGram + fatsGram + proteinsGram;
    final hasData = totalMacroGrams > 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: hasData
                      ? _buildSections(context, totalMacroGrams)
                      : _buildEmptySections(context),
                  sectionsSpace: 2,
                  centerSpaceRadius: 50,
                  startDegreeOffset: -90,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${caloriesConsumed.toInt()}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '/ ${calorieGoal.toInt()} ${S.of(context).kcalLabel}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.6),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildLegend(context, totalMacroGrams),
      ],
    );
  }

  List<PieChartSectionData> _buildSections(
      BuildContext context, double totalGrams) {
    final nc = context.nutriqColors;
    final carbPct = totalGrams > 0 ? (carbsGram / totalGrams) * 100 : 0.0;
    final fatPct = totalGrams > 0 ? (fatsGram / totalGrams) * 100 : 0.0;
    final proteinPct = totalGrams > 0 ? (proteinsGram / totalGrams) * 100 : 0.0;

    return [
      _makeSection(carbPct, nc.carbsColor),
      _makeSection(fatPct, nc.fatColor),
      _makeSection(proteinPct, nc.proteinColor),
    ];
  }

  PieChartSectionData _makeSection(double pct, Color color) {
    return PieChartSectionData(
      value: pct,
      color: color,
      radius: 30,
      title: pct >= 5 ? '${pct.toInt()}%' : '',
      titleStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  List<PieChartSectionData> _buildEmptySections(BuildContext context) {
    return [
      PieChartSectionData(
        value: 1,
        color: Theme.of(context).colorScheme.outlineVariant,
        radius: 30,
        title: '',
      ),
    ];
  }

  Widget _buildLegend(BuildContext context, double totalGrams) {
    final l10n = S.of(context);
    final nc = context.nutriqColors;
    final carbPct = totalGrams > 0 ? (carbsGram / totalGrams) * 100 : 0.0;
    final fatPct = totalGrams > 0 ? (fatsGram / totalGrams) * 100 : 0.0;
    final proteinPct = totalGrams > 0 ? (proteinsGram / totalGrams) * 100 : 0.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(
          color: nc.carbsColor,
          label: l10n.carbsLabel,
          grams: carbsGram,
          pct: carbPct,
        ),
        const SizedBox(width: 16),
        _LegendItem(
          color: nc.fatColor,
          label: l10n.fatLabel,
          grams: fatsGram,
          pct: fatPct,
        ),
        const SizedBox(width: 16),
        _LegendItem(
          color: nc.proteinColor,
          label: l10n.proteinLabel,
          grams: proteinsGram,
          pct: proteinPct,
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final double grams;
  final double pct;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.grams,
    required this.pct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        Text(
          '${grams.toInt()}g (${pct.toInt()}%)',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
              ),
        ),
      ],
    );
  }
}
