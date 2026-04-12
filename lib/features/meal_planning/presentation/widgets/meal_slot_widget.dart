import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class MealSlotWidget extends StatelessWidget {
  final IntakeTypeEntity mealSlot;
  final DateTime date;
  final List<MealPlanEntity> plans;

  const MealSlotWidget({
    super.key,
    required this.mealSlot,
    required this.date,
    required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, dynamic>>(
      onAcceptWithDetails: (details) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).mealAddedToPlanLabel)),
        );
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: candidateData.isNotEmpty
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                mealSlot.getIconData(),
                size: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 4),
              Text(
                _slotLabel(mealSlot),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              if (plans.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemCount: plans.length,
                    itemBuilder: (context, index) {
                      final plan = plans[index];
                      return Chip(
                        label: Text(
                          plan.recipeId ?? plan.mealId ?? plan.note ?? '—',
                          style: Theme.of(context).textTheme.labelSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        deleteIcon: const Icon(Icons.close, size: 14),
                        onDeleted: () {
                          context.read<MealPlanBloc>().add(
                                RemoveMealFromSlot(id: plan.id),
                              );
                        },
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: Text(
                      S.of(context).emptySlotLabel,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.5),
                          ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  String _slotLabel(IntakeTypeEntity slot) {
    switch (slot) {
      case IntakeTypeEntity.breakfast:
        return 'B';
      case IntakeTypeEntity.lunch:
        return 'L';
      case IntakeTypeEntity.dinner:
        return 'D';
      case IntakeTypeEntity.snack:
        return 'S';
    }
  }
}
