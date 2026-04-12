import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/generated/l10n.dart';

class ExerciseCalorieImpactList extends StatelessWidget {
  final List<UserActivityEntity> userActivities;
  final double totalBurnedCalories;

  const ExerciseCalorieImpactList({
    super.key,
    required this.userActivities,
    required this.totalBurnedCalories,
  });

  @override
  Widget build(BuildContext context) {
    if (userActivities.isEmpty) {
      return const SizedBox();
    }

    final l10n = S.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fitness_center_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 8.0),
                Text(
                  l10n.exerciseListLabel,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                ),
                const Spacer(),
                Text(
                  '${totalBurnedCalories.toInt()} ${l10n.kcalLabel}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            ...userActivities.map((activity) => _ExerciseImpactRow(
                  activity: activity,
                )),
          ],
        ),
      ),
    );
  }
}

class _ExerciseImpactRow extends StatelessWidget {
  final UserActivityEntity activity;

  const _ExerciseImpactRow({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            activity.physicalActivityEntity.displayIcon,
            size: 18,
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              activity.physicalActivityEntity.getName(context),
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${activity.duration.toInt()} min',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
          const SizedBox(width: 8.0),
          Text(
            '-${activity.burnedKcal.toInt()} ${S.of(context).kcalLabel}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        ],
      ),
    );
  }
}
