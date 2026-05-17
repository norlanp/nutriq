import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';

class BgTrendChart extends StatelessWidget {
  final List<BloodGlucoseEntity> entries;

  const BgTrendChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    final sorted = List.of(entries)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    final spots = sorted
        .map((e) => FlSpot(e.timestamp.millisecondsSinceEpoch.toDouble(),
            e.valueMgDl.toDouble()))
        .toList();

    final minX = spots.first.x;
    final maxX = spots.last.x;

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          minY: 40,
          maxY: 300,
          minX: minX,
          maxX: maxX,
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) => Text('${value.toInt()}',
                    style: Theme.of(context).textTheme.labelSmall ?? const TextStyle(fontSize: 10)),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                  y: 70,
                  color: Theme.of(context).colorScheme.error.withValues(alpha: 0.4),
                  strokeWidth: 1,
                  dashArray: [4, 4]),
              HorizontalLine(
                  y: 180,
                  color: context.nutriqColors.warning.withValues(alpha: 0.4),
                  strokeWidth: 1,
                  dashArray: [4, 4]),
            ],
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Theme.of(context).colorScheme.primary,
              barWidth: 2,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
