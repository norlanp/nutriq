import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/core/styles/nutriq_spacing.dart';
import 'package:nutriq/features/water_tracking/presentation/notifier/water_notifier.dart';

import 'package:nutriq/generated/l10n.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterTrackerSummaryWidget extends ConsumerStatefulWidget {
  const WaterTrackerSummaryWidget({super.key});

  @override
  ConsumerState<WaterTrackerSummaryWidget> createState() =>
      _WaterTrackerSummaryWidgetState();
}

class _WaterTrackerSummaryWidgetState
    extends ConsumerState<WaterTrackerSummaryWidget> {
  static const int _defaultDailyGoal = 2000;
  bool _initialLoadDone = false;

  @override
  void initState() {
    super.initState();
  }

  void _addWater(int amountMl) {
    final now = DateTime.now();
    final entry = WaterEntity(
      id: 0,
      userId: 0,
      amountMl: amountMl,
      date: DateTime(now.year, now.month, now.day),
      timestamp: now,
    );
    ref.read(waterNotifierProvider.notifier).addWater(
        entry, entry.date, dailyGoal: _defaultDailyGoal);
  }

  void _navigateToWaterTracker() async {
    await context.push(AppRoutes.waterTracking);
    if (mounted) {
      ref.read(waterNotifierProvider.notifier).loadWater(DateTime.now(), dailyGoal: _defaultDailyGoal);
    }
  }

  @override
  Widget build(BuildContext context) {
    final waterState = ref.watch(waterNotifierProvider);

    if (!_initialLoadDone) {
      _initialLoadDone = true;
      Future.microtask(() => ref
          .read(waterNotifierProvider.notifier)
          .loadWater(DateTime.now(), dailyGoal: _defaultDailyGoal));
    }

    if (waterState.isLoading) {
      return const Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    if (waterState.hasError) {
      return const SizedBox.shrink();
    }

    return _WaterSummaryContent(
      dailyTotal: waterState.dailyTotal,
      dailyGoal: waterState.dailyGoal,
      onAddWater: _addWater,
      onTap: _navigateToWaterTracker,
    );
  }
}

class _WaterSummaryContent extends StatelessWidget {
  final int dailyTotal;
  final int dailyGoal;
  final void Function(int amountMl) onAddWater;
  final VoidCallback onTap;

  const _WaterSummaryContent({
    required this.dailyTotal,
    required this.dailyGoal,
    required this.onAddWater,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sp = context.spacing;
    final percent =
        dailyGoal > 0 ? (dailyTotal / dailyGoal).clamp(0.0, 1.0) : 0.0;

    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: sp.lg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(sp.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    lineWidth: 8,
                    percent: percent,
                    progressColor: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.primaryContainer
                        .withValues(alpha: 0.3),
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 600,
                    center: Icon(
                      Icons.water_drop,
                      size: 28,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(width: sp.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).waterTrackerTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: sp.xs),
                        Text(
                          S
                              .of(context)
                              .waterProgress('$dailyTotal', '$dailyGoal'),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _QuickAddChip(
                    icon: Icons.local_cafe_outlined,
                    label: '250',
                    onTap: () => onAddWater(250),
                  ),
                  SizedBox(width: sp.sm),
                  _QuickAddChip(
                    icon: Icons.local_drink_outlined,
                    label: '500',
                    onTap: () => onAddWater(500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAddChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAddChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ActionChip(
      onPressed: onTap,
      avatar: Icon(icon, size: 18, color: theme.colorScheme.primary),
      label: Text(
        '$label ${S.of(context).ml}',
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}