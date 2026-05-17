import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterProgressRing extends StatelessWidget {
  final int current;
  final int goal;

  const WaterProgressRing({
    super.key,
    required this.current,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final percent = goal > 0 ? (current / goal).clamp(0.0, 1.0) : 0.0;
    final theme = Theme.of(context);
    final l10n = S.of(context);

    return Semantics(
      label: l10n.waterProgressLabel(current, goal),
      child: CircularPercentIndicator(
        radius: 120,
        lineWidth: 16,
        percent: percent,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.water_drop,
              size: 48,
              color: theme.colorScheme.primary,
              semanticLabel: l10n.waterTrackerTitle,
            ),
            const SizedBox(height: 4),
            Text(
              '${(percent * 100).toInt()}%',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        progressColor: theme.colorScheme.primary,
        backgroundColor:
            theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        animationDuration: 600,
      ),
    );
  }
}
