import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class MonthlyCalorieChart extends StatelessWidget {
  final List<TrackedDayEntity> trackedDays;
  final int year;
  final int month;

  const MonthlyCalorieChart({
    super.key,
    required this.trackedDays,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final dayMap = <int, TrackedDayEntity>{};
    for (final td in trackedDays) {
      dayMap[td.day.day] = td;
    }

    double maxKcal = 0;
    double calorieGoal = 0;
    final barGroups = <BarChartGroupData>[];

    for (int i = 0; i < daysInMonth; i++) {
      final dayNum = i + 1;
      final td = dayMap[dayNum];
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
              width: daysInMonth > 28 ? 6 : 8,
              borderRadius: BorderRadius.circular(2),
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

    final interval = (daysInMonth / 6).ceilToDouble();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.monthlyCalorieChart,
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
                        interval: interval,
                        getTitlesWidget: (value, meta) {
                          final dayNum = value.toInt() + 1;
                          if (dayNum < 1 || dayNum > daysInMonth) {
                            return const SizedBox();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '$dayNum',
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
                        final dayNum = group.x + 1;
                        final td = dayMap[dayNum];
                        final kcal = td?.caloriesTracked ?? 0;
                        return BarTooltipItem(
                          '$dayNum. ${td?.day.month ?? month}\n${kcal.toInt()} ${l10n.kcalLabel}',
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
}
