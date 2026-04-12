import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class MeasurementTrendChart extends StatefulWidget {
  final List<BodyMeasurementEntity> measurements;

  const MeasurementTrendChart({super.key, required this.measurements});

  @override
  State<MeasurementTrendChart> createState() => _MeasurementTrendChartState();
}

class _MeasurementTrendChartState extends State<MeasurementTrendChart> {
  final Set<String> _enabled = {'waist'};

  static const _keys = ['waist', 'neck', 'hip', 'chest', 'bicep', 'thigh'];

  double? _getValue(BodyMeasurementEntity m, String key) {
    switch (key) {
      case 'waist':
        return m.waistCm;
      case 'neck':
        return m.neckCm;
      case 'hip':
        return m.hipCm;
      case 'chest':
        return m.chestCm;
      case 'bicep':
        return m.bicepCm;
      case 'thigh':
        return m.thighCm;
      default:
        return null;
    }
  }

  String _getLabel(S s, String key) {
    switch (key) {
      case 'waist':
        return s.waistCm;
      case 'neck':
        return s.neckCm;
      case 'hip':
        return s.hipCm;
      case 'chest':
        return s.chestCm;
      case 'bicep':
        return s.bicepCm;
      case 'thigh':
        return s.thighCm;
      default:
        return key;
    }
  }

  Color _getColor(String key) {
    switch (key) {
      case 'waist':
        return Colors.blue;
      case 'neck':
        return Colors.orange;
      case 'hip':
        return Colors.purple;
      case 'chest':
        return Colors.green;
      case 'bicep':
        return Colors.red;
      case 'thigh':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.measurements.isEmpty) {
      return const SizedBox.shrink();
    }
    final s = S.of(context);

    final sorted = List<BodyMeasurementEntity>.from(widget.measurements)
      ..sort((a, b) => a.date.compareTo(b.date));

    double? minVal;
    double? maxVal;
    for (final m in sorted) {
      for (final key in _enabled) {
        final v = _getValue(m, key);
        if (v != null) {
          minVal = minVal == null ? v : (v < minVal ? v : minVal);
          maxVal = maxVal == null ? v : (v > maxVal ? v : maxVal);
        }
      }
    }

    if (minVal != null && maxVal != null) {
      final pad = (maxVal - minVal) * 0.1;
      minVal -= pad;
      maxVal += pad;
      if (minVal < 0) minVal = 0;
    }

    final lineBarsData = _enabled.map((key) {
      final points = sorted
          .where((m) => _getValue(m, key) != null)
          .map((m) => FlSpot(
                m.date.millisecondsSinceEpoch.toDouble(),
                _getValue(m, key)!,
              ))
          .toList();
      return LineChartBarData(
        spots: points,
        isCurved: true,
        color: _getColor(key),
        barWidth: 2,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.measurementHistory,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _keys.map((key) {
            final enabled = _enabled.contains(key);
            return FilterChip(
              label: Text(_getLabel(s, key)),
              selected: enabled,
              selectedColor: _getColor(key).withValues(alpha: 0.3),
              checkmarkColor: _getColor(key),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _enabled.add(key);
                  } else {
                    _enabled.remove(key);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: lineBarsData.isEmpty
              ? const Center(child: Text('—'))
              : LineChart(
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
                    lineBarsData: lineBarsData,
                  ),
                ),
        ),
      ],
    );
  }
}
