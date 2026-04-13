import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class TrackerTrendChart extends StatelessWidget {
  final List<CustomTrackerEntryEntity> entries;
  final String trackerName;

  const TrackerTrendChart({
    super.key,
    required this.entries,
    required this.trackerName,
  });

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final sorted = List<CustomTrackerEntryEntity>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));

    final spots = sorted
        .map((e) => FlSpot(
              e.date.millisecondsSinceEpoch.toDouble(),
              e.value,
            ))
        .toList();

    double? minVal;
    double? maxVal;
    for (final e in sorted) {
      minVal = minVal == null ? e.value : (e.value < minVal ? e.value : minVal);
      maxVal = maxVal == null ? e.value : (e.value > maxVal ? e.value : maxVal);
    }

    if (minVal != null && maxVal != null) {
      final pad = (maxVal - minVal) * 0.1;
      minVal -= pad;
      maxVal += pad;
      if (minVal < 0) minVal = 0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).trackerTrend,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: minVal,
              maxY: maxVal,
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(reservedSize: 40)),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Theme.of(context).colorScheme.primary,
                  barWidth: 2,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
