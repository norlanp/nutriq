import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';

class BgDayTimeline extends StatelessWidget {
  final List<BloodGlucoseEntity> entries;
  final Color Function(int valueMgDl) valueColor;

  const BgDayTimeline({
    super.key,
    required this.entries,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    final sorted = List.of(entries)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sorted.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final entry = sorted[index];
          final hour = entry.timestamp.hour.toString().padLeft(2, '0');
          final minute = entry.timestamp.minute.toString().padLeft(2, '0');
          final color = valueColor(entry.valueMgDl);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color, width: 1.5),
                ),
                  child: Text(
                  '${entry.valueMgDl}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$hour:$minute',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
