import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_goal_selection_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class OnboardingFourthPageBody extends ConsumerWidget {
  const OnboardingFourthPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(onboardingFormProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).goalLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingGoalQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          ChoiceChip(
            label: Text(S.of(context).goalLoseWeight,
                style: Theme.of(context).textTheme.titleLarge),
            selected: form.goal.value == UserGoalSelectionEntity.loseWeight,
            onSelected: (bool selected) {
              ref
                  .read(onboardingFormProvider.notifier)
                  .goalChanged(UserGoalSelectionEntity.loseWeight);
            },
          ),
          const SizedBox(height: 8.0),
          ChoiceChip(
            label: Text(S.of(context).goalMaintainWeight,
                style: Theme.of(context).textTheme.titleLarge),
            selected: form.goal.value == UserGoalSelectionEntity.maintainWeight,
            onSelected: (bool selected) {
              ref
                  .read(onboardingFormProvider.notifier)
                  .goalChanged(UserGoalSelectionEntity.maintainWeight);
            },
          ),
          const SizedBox(height: 8.0),
          ChoiceChip(
            label: Text(S.of(context).goalGainWeight,
                style: Theme.of(context).textTheme.titleLarge),
            selected: form.goal.value == UserGoalSelectionEntity.gainWeigh,
            onSelected: (bool selected) {
              ref
                  .read(onboardingFormProvider.notifier)
                  .goalChanged(UserGoalSelectionEntity.gainWeigh);
            },
          ),
        ],
      ),
    );
  }
}