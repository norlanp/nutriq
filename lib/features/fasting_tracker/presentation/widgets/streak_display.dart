import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

class StreakDisplay extends StatelessWidget {
  final int streak;

  const StreakDisplay({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department,
              color: streak > 0 ? Colors.orange : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              '${S.of(context).streakLabel}: $streak',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
