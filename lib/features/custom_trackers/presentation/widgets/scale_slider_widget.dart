import 'package:flutter/material.dart';

class ScaleSliderWidget extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final String? unit;
  final ValueChanged<double> onChanged;

  const ScaleSliderWidget({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${value.toStringAsFixed(1)}${unit != null ? ' $unit' : ''}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).toInt() > 100 ? 100 : (max - min).toInt(),
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(min.toStringAsFixed(0)),
            Text(max.toStringAsFixed(0)),
          ],
        ),
      ],
    );
  }
}
