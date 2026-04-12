import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

class RemainingBudgetRow extends StatelessWidget {
  final double calorieGoal;
  final double consumedCalories;
  final double burnedCalories;

  const RemainingBudgetRow({
    super.key,
    required this.calorieGoal,
    required this.consumedCalories,
    required this.burnedCalories,
  });

  double get _remainingBudget =>
      calorieGoal - consumedCalories + burnedCalories;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final remaining = _remainingBudget;
    final isOverBudget = remaining < 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.all(0.0),
        color: isOverBudget
            ? Theme.of(context).colorScheme.errorContainer
            : Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                isOverBudget
                    ? Icons.warning_amber_outlined
                    : Icons.savings_outlined,
                size: 20,
                color: isOverBudget
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  l10n.remainingBudgetLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isOverBudget
                            ? Theme.of(context).colorScheme.onErrorContainer
                            : Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                      ),
                ),
              ),
              Text(
                '${remaining.toInt()} ${l10n.kcalLabel}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isOverBudget
                          ? Theme.of(context).colorScheme.onErrorContainer
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
