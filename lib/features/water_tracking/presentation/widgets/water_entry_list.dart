import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class WaterEntryList extends StatelessWidget {
  final List<WaterEntity> entries;
  final void Function(WaterEntity) onDelete;

  const WaterEntryList({
    super.key,
    required this.entries,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Text(
          S.of(context).noWaterEntries,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    final sorted = List<WaterEntity>.from(entries)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).todayEntries,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...sorted.map((entry) => _WaterEntryTile(
              entry: entry,
              onDelete: () => onDelete(entry),
            )),
      ],
    );
  }
}

class _WaterEntryTile extends StatelessWidget {
  final WaterEntity entry;
  final VoidCallback onDelete;

  const _WaterEntryTile({
    required this.entry,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final time =
        '${entry.timestamp.hour.toString().padLeft(2, '0')}:${entry.timestamp.minute.toString().padLeft(2, '0')}';

    return Dismissible(
      key: ValueKey(entry.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
      ),
      child: ListTile(
        leading: const Icon(Icons.water_drop),
        title: Text('${entry.amountMl} ml'),
        subtitle: Text(time),
      ),
    );
  }
}
