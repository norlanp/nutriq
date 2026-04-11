import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class WeeklyNutritionSummary extends StatelessWidget {
  final Map<DateTime, List<IntakeEntity>> weeklyIntakes;
  final Map<DateTime, TrackedDayEntity> weeklyTrackedDays;
  final DateTime startOfWeek;

  const WeeklyNutritionSummary({
    super.key,
    required this.weeklyIntakes,
    required this.weeklyTrackedDays,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final days = List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
    final barGroups = <BarChartGroupData>[];

    double maxKcal = 0;
    double calorieGoal = 0;

    for (int i = 0; i < 7; i++) {
      final day = days[i];
      final intakes = weeklyIntakes[day] ?? [];
      final trackedDay = weeklyTrackedDays[day];

      final carbsKcal =
          intakes.fold(0.0, (sum, it) => sum + it.totalCarbsGram * 4.0);
      final fatsKcal =
          intakes.fold(0.0, (sum, it) => sum + it.totalFatsGram * 9.0);
      final proteinsKcal =
          intakes.fold(0.0, (sum, it) => sum + it.totalProteinsGram * 4.0);

      final totalKcal = carbsKcal + fatsKcal + proteinsKcal;
      if (totalKcal > maxKcal) maxKcal = totalKcal;

      if (trackedDay != null) {
        calorieGoal = trackedDay.calorieGoal;
      }

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: totalKcal,
              width: 20,
              borderRadius: BorderRadius.circular(4),
              rodStackItems: [
                BarChartRodStackItem(
                  0,
                  carbsKcal,
                  Theme.of(context).colorScheme.primary,
                ),
                BarChartRodStackItem(
                  carbsKcal,
                  carbsKcal + fatsKcal,
                  Theme.of(context).colorScheme.tertiary,
                ),
                BarChartRodStackItem(
                  carbsKcal + fatsKcal,
                  totalKcal,
                  Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          ],
        ),
      );
    }

    final chartMaxY = (maxKcal > calorieGoal ? maxKcal : calorieGoal) * 1.15;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.weeklySummaryLabel,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: chartMaxY > 0 ? chartMaxY : 2500,
                  barGroups: barGroups,
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: calorieGoal,
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.5),
                        strokeWidth: 1.5,
                        dashArray: [6, 4],
                      ),
                    ],
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final dayIndex = value.toInt();
                          if (dayIndex < 0 || dayIndex > 6) {
                            return const SizedBox();
                          }
                          final day = days[dayIndex];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _getDayAbbrev(context, day),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value % 500 != 0) return const SizedBox();
                          return Text(
                            '${value.toInt()}',
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 500,
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipPadding: const EdgeInsets.all(8),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final day = days[group.x];
                        final intakes = weeklyIntakes[day] ?? [];
                        final totalKcal =
                            intakes.fold(0.0, (sum, it) => sum + it.totalKcal);
                        return BarTooltipItem(
                          '${totalKcal.toInt()} ${l10n.kcalLabel}',
                          TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildLegend(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    final l10n = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendDot(
            color: Theme.of(context).colorScheme.primary,
            label: l10n.carbsLabel),
        const SizedBox(width: 12),
        _LegendDot(
            color: Theme.of(context).colorScheme.tertiary,
            label: l10n.fatLabel),
        const SizedBox(width: 12),
        _LegendDot(
            color: Theme.of(context).colorScheme.error,
            label: l10n.proteinLabel),
      ],
    );
  }

  String _getDayAbbrev(BuildContext context, DateTime day) {
    final materialL10n = MaterialLocalizations.of(context);
    return materialL10n.narrowWeekdays[day.weekday % 7];
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
