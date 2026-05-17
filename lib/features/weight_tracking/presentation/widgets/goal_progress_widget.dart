import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:nutriq/generated/l10n.dart';

class GoalProgressWidget extends ConsumerWidget {
  const GoalProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<UserEntity?>(
      future: _getUser(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }

        final user = snapshot.data!;

        // Estimate goal weight: ~0.5 kg/week deficit or surplus
        // Use a simple heuristic: if losing weight, goal is -10kg; if gaining, +5kg
        // For maintain, show current weight as goal
        double goalWeightKg;
        switch (user.goal) {
          case UserWeightGoalEntity.loseWeight:
            goalWeightKg = user.weightKG - 10;
            break;
          case UserWeightGoalEntity.gainWeight:
            goalWeightKg = user.weightKG + 5;
            break;
          case UserWeightGoalEntity.maintainWeight:
            goalWeightKg = user.weightKG;
            break;
        }

        if (goalWeightKg <= 0) goalWeightKg = user.weightKG;

        final startWeight = user.weightKG;
        final currentWeight = user.weightKG;

        // Calculate progress percentage
        double progress;
        if (startWeight == goalWeightKg) {
          progress = 1.0;
        } else {
          final totalChange = (startWeight - goalWeightKg).abs();
          final currentChange = (startWeight - currentWeight).abs();
          progress = (currentChange / totalChange).clamp(0.0, 1.0);
        }

        return Semantics(
          label: S.of(context).goalProgressLabel((progress * 100).toInt()),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).goalWeight,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12.0),
                  LinearPercentIndicator(
                    percent: progress,
                    lineHeight: 12.0,
                    barRadius: const Radius.circular(6),
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    progressColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).startWeight}: ${startWeight.toStringAsFixed(1)} kg',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${S.of(context).goalWeight}: ${goalWeightKg.toStringAsFixed(1)} kg',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Center(
                    child: Text(
                      '${S.of(context).currentWeight}: ${currentWeight.toStringAsFixed(1)} kg',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<UserEntity?> _getUser(WidgetRef ref) async {
    try {
      return await ref.read(getUserUsecaseProvider).getUserData();
    } catch (_) {
      return null;
    }
  }
}
