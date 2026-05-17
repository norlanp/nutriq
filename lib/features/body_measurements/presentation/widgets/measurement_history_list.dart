import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class MeasurementHistoryList extends StatelessWidget {
  final List<BodyMeasurementEntity> measurements;
  final void Function(BodyMeasurementEntity) onDelete;

  const MeasurementHistoryList(
      {super.key, required this.measurements, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    if (measurements.isEmpty) {
      return Text(s.noMeasurements);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.measurementHistory,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...measurements.map((m) => Card(
              child: ListTile(
                title: Text(m.date.toLocal().toString().substring(0, 10)),
                subtitle: Text([
                  if (m.waistCm != null) '${s.waistCm}: ${m.waistCm}',
                  if (m.neckCm != null) '${s.neckCm}: ${m.neckCm}',
                  if (m.hipCm != null) '${s.hipCm}: ${m.hipCm}',
                  if (m.chestCm != null) '${s.chestCm}: ${m.chestCm}',
                  if (m.bicepCm != null) '${s.bicepCm}: ${m.bicepCm}',
                  if (m.thighCm != null) '${s.thighCm}: ${m.thighCm}',
                ].join(', ')),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                  onPressed: () => onDelete(m),
                ),
              ),
            )),
      ],
    );
  }
}
