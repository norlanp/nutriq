import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class WeeklyCalorieChart extends StatelessWidget {
  final List<TrackedDayEntity> trackedDays;
  final DateTime startOfWeek;

  const WeeklyCalorieChart({
    super.key,
    required this.trackedDays,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final days = List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
    final dayMap = <DateTime, TrackedDayEntity>{};
    for (final td in trackedDays) {
      final key = DateTime(td.day.year, td.day.month, td.day.day);
      dayMap[key] = td;
    }

    double maxKcal = 0;
    double calorieGoal = 0;
    final barGroups = <BarChartGroupData>[];

    for (int i = 0; i < 7; i++) {
      final day = days[i];
      final key = DateTime(day.year, day.month, day.day);
      final td = dayMap[key];
      final tracked = td?.caloriesTracked ?? 0;
      final goal = td?.calorieGoal ?? 0;
      if (goal > 0) calorieGoal = goal;
      if (tracked > maxKcal) maxKcal = tracked;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: tracked,
              width: 20,
              borderRadius: BorderRadius.circular(4),
              color: tracked > 0
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
            ),
          ],
        ),
      );
    }

    if (maxKcal == 0 && calorieGoal == 0) {
      maxKcal = 2000;
      calorieGoal = 2000;
    }

    final chartMaxY = (maxKcal > calorieGoal ? maxKcal : calorieGoal) * 1.15;
    final avgCalories = trackedDays.isEmpty
        ? 0.0
        : trackedDays.map((td) => td.caloriesTracked).reduce((a, b) => a + b) /
            trackedDays.length;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.weeklyCalorieChart,
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
                  maxY: chartMaxY,
                  barGroups: barGroups,
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      if (calorieGoal > 0)
                        HorizontalLine(
                          y: calorieGoal,
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withValues(alpha: 0.5),
                          strokeWidth: 1.5,
                          dashArray: [6, 4],
                        ),
                      if (avgCalories > 0)
                        HorizontalLine(
                          y: avgCalories,
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withValues(alpha: 0.7),
                          strokeWidth: 2,
                          dashArray: [10, 5],
                          label: HorizontalLineLabel(
                            show: true,
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(bottom: 4),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                            labelResolver: (line) =>
                                '${l10n.averageLabel}: ${avgCalories.toInt()}',
                          ),
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
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
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
                        final key = DateTime(day.year, day.month, day.day);
                        final td = dayMap[key];
                        final kcal = td?.caloriesTracked ?? 0;
                        return BarTooltipItem(
                          '${kcal.toInt()} ${l10n.kcalLabel}',
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
          ],
        ),
      ),
    );
  }

  String _getDayAbbrev(BuildContext context, DateTime day) {
    final materialL10n = MaterialLocalizations.of(context);
    return materialL10n.narrowWeekdays[day.weekday % 7];
  }
}
