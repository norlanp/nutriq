import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class WeightTrendChart extends StatelessWidget {
  final List<WeightEntity> weights;
  final double? goalWeightKg;

  const WeightTrendChart({super.key, required this.weights, this.goalWeightKg});

  @override
  Widget build(BuildContext context) {
    final sorted = List<WeightEntity>.from(weights)
      ..sort((a, b) => a.date.compareTo(b.date));

    if (sorted.length < 2) return const SizedBox();

    final spots = <FlSpot>[];
    for (int i = 0; i < sorted.length; i++) {
      spots.add(FlSpot(i.toDouble(), sorted[i].weightKg));
    }

    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    final paddedMinY = minY - 2;
    final paddedMaxY = maxY + 2;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).weightTrend,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minY: goalWeightKg != null
                      ? (paddedMinY < goalWeightKg!
                          ? paddedMinY
                          : goalWeightKg! - 2)
                      : paddedMinY,
                  maxY: goalWeightKg != null
                      ? (paddedMaxY > goalWeightKg!
                          ? paddedMaxY
                          : goalWeightKg! + 2)
                      : paddedMaxY,
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(
                          value.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: (sorted.length / 5).ceilToDouble(),
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= sorted.length) {
                            return const SizedBox();
                          }
                          final d = sorted[index].date;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${d.day}/${d.month}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 2,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 3,
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 0,
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) =>
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      getTooltipItems: (spots) => spots
                          .map((s) => LineTooltipItem(
                                '${sorted[s.x.toInt()].date.day}.${sorted[s.x.toInt()].date.month}.${sorted[s.x.toInt()].date.year}\n${s.y.toStringAsFixed(1)} kg',
                                TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: goalWeightKg != null
                        ? [
                            HorizontalLine(
                              y: goalWeightKg!,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withValues(alpha: 0.7),
                              strokeWidth: 1.5,
                              dashArray: [8, 4],
                              label: HorizontalLineLabel(
                                show: true,
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(bottom: 4),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                labelResolver: (line) =>
                                    '${S.of(context).goalWeight}: ${goalWeightKg!.toStringAsFixed(1)}',
                              ),
                            ),
                          ]
                        : [],
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
