import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class MacroTrendChart extends StatelessWidget {
  final List<TrackedDayEntity> trackedDays;
  final DateTime startDate;
  final int dayCount;

  const MacroTrendChart({
    super.key,
    required this.trackedDays,
    required this.startDate,
    required this.dayCount,
  });

  factory MacroTrendChart.weekly({
    required List<TrackedDayEntity> trackedDays,
    required DateTime startOfWeek,
  }) {
    return MacroTrendChart(
      trackedDays: trackedDays,
      startDate: startOfWeek,
      dayCount: 7,
    );
  }

  factory MacroTrendChart.monthly({
    required List<TrackedDayEntity> trackedDays,
    required int year,
    required int month,
  }) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    return MacroTrendChart(
      trackedDays: trackedDays,
      startDate: DateTime(year, month, 1),
      dayCount: daysInMonth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final dayMap = <DateTime, TrackedDayEntity>{};
    for (final td in trackedDays) {
      final key = DateTime(td.day.year, td.day.month, td.day.day);
      dayMap[key] = td;
    }

    final days =
        List.generate(dayCount, (i) => startDate.add(Duration(days: i)));

    double maxKcal = 0;
    final barGroups = <BarChartGroupData>[];

    for (int i = 0; i < dayCount; i++) {
      final day = days[i];
      final key = DateTime(day.year, day.month, day.day);
      final td = dayMap[key];
      final carbsKcal = (td?.carbsTracked ?? 0) * 4.0;
      final fatsKcal = (td?.fatTracked ?? 0) * 9.0;
      final proteinsKcal = (td?.proteinTracked ?? 0) * 4.0;
      final totalKcal = carbsKcal + fatsKcal + proteinsKcal;
      if (totalKcal > maxKcal) maxKcal = totalKcal;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: totalKcal > 0 ? totalKcal : 0,
              width: dayCount <= 7 ? 20 : (dayCount <= 14 ? 10 : 6),
              borderRadius: BorderRadius.circular(2),
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

    final chartMaxY = maxKcal > 0 ? maxKcal * 1.15 : 2500.0;
    final showBottomTitles = dayCount <= 7;
    final bottomInterval = (dayCount / 6).ceilToDouble();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.macroTrendChart,
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
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: showBottomTitles ? 1 : bottomInterval,
                        getTitlesWidget: (value, meta) {
                          final dayIndex = value.toInt();
                          if (dayIndex < 0 || dayIndex >= dayCount) {
                            return const SizedBox();
                          }
                          if (showBottomTitles) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                _getDayAbbrev(context, days[dayIndex]),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${dayIndex + 1}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            );
                          }
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
                        final carbs =
                            (td?.carbsTracked ?? 0).toStringAsFixed(0);
                        final fats = (td?.fatTracked ?? 0).toStringAsFixed(0);
                        final proteins =
                            (td?.proteinTracked ?? 0).toStringAsFixed(0);
                        return BarTooltipItem(
                          '${td?.caloriesTracked.toInt() ?? 0} ${l10n.kcalLabel}\n'
                          '${l10n.carbsLabel}: ${carbs}g\n'
                          '${l10n.fatLabel}: ${fats}g\n'
                          '${l10n.proteinLabel}: ${proteins}g',
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
            _buildLegend(context, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(BuildContext context, S l10n) {
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
