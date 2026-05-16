import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/presentation/widgets/info_dialog.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_activity_selection_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class OnboardingThirdPageBody extends ConsumerWidget {
  const OnboardingThirdPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(onboardingFormProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).activityLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingActivityQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(S.of(context).palSedentaryLabel,
                      style: Theme.of(context).textTheme.titleLarge),
                  selected: form.activity.value ==
                      UserActivitySelectionEntity.sedentary,
                  onSelected: (bool selected) {
                    ref
                        .read(onboardingFormProvider.notifier)
                        .activityChanged(UserActivitySelectionEntity.sedentary);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => InfoDialog(
                                title: S.of(context).palSedentaryLabel,
                                body: S
                                    .of(context)
                                    .palSedentaryDescriptionLabel));
                      },
                      child: const Icon(Icons.help_outline_outlined)),
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: 400,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(S.of(context).palLowLActiveLabel,
                      style: Theme.of(context).textTheme.titleLarge),
                  selected: form.activity.value ==
                      UserActivitySelectionEntity.lowActive,
                  onSelected: (bool selected) {
                    ref
                        .read(onboardingFormProvider.notifier)
                        .activityChanged(UserActivitySelectionEntity.lowActive);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => InfoDialog(
                                title: S.of(context).palLowLActiveLabel,
                                body: S
                                    .of(context)
                                    .palLowActiveDescriptionLabel));
                      },
                      child: const Icon(Icons.help_outline_outlined)),
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: 400,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(S.of(context).palActiveLabel,
                      style: Theme.of(context).textTheme.titleLarge),
                  selected: form.activity.value ==
                      UserActivitySelectionEntity.active,
                  onSelected: (bool selected) {
                    ref
                        .read(onboardingFormProvider.notifier)
                        .activityChanged(UserActivitySelectionEntity.active);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => InfoDialog(
                                title: S.of(context).palActiveLabel,
                                body: S.of(context).palActiveDescriptionLabel));
                      },
                      child: const Icon(Icons.help_outline_outlined)),
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: 400,
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(S.of(context).palVeryActiveLabel,
                      style: Theme.of(context).textTheme.titleLarge),
                  selected: form.activity.value ==
                      UserActivitySelectionEntity.veryActive,
                  onSelected: (bool selected) {
                    ref
                        .read(onboardingFormProvider.notifier)
                        .activityChanged(UserActivitySelectionEntity.veryActive);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => InfoDialog(
                                title: S.of(context).palVeryActiveLabel,
                                body: S
                                    .of(context)
                                    .palVeryActiveDescriptionLabel));
                      },
                      child: const Icon(Icons.help_outline_outlined)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}