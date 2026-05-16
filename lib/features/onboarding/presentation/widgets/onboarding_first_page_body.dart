import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:nutriq/features/onboarding/domain/entity/user_gender_selection_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class OnboardingFirstPageBody extends ConsumerStatefulWidget {
  const OnboardingFirstPageBody({super.key});

  @override
  ConsumerState<OnboardingFirstPageBody> createState() =>
      _OnboardingFirstPageBodyState();
}

class _OnboardingFirstPageBodyState
    extends ConsumerState<OnboardingFirstPageBody> {
  final _dateInput = TextEditingController();

  @override
  void dispose() {
    _dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(onboardingFormProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).genderLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingGenderQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          ChoiceChip(
            label: Text(S.of(context).genderMaleLabel),
            selected:
                form.gender.value == UserGenderSelectionEntity.genderMale,
            onSelected: (bool selected) {
              ref
                  .read(onboardingFormProvider.notifier)
                  .genderChanged(UserGenderSelectionEntity.genderMale);
            },
          ),
          ChoiceChip(
            label: Text(S.of(context).genderFemaleLabel),
            selected:
                form.gender.value == UserGenderSelectionEntity.genderFemale,
            onSelected: (bool selected) {
              ref
                  .read(onboardingFormProvider.notifier)
                  .genderChanged(UserGenderSelectionEntity.genderFemale);
            },
          ),
          const SizedBox(height: 32.0),
          Text(S.of(context).ageLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingBirthdayQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _dateInput,
            readOnly: true,
            decoration: InputDecoration(
              hintText: S.of(context).onboardingEnterBirthdayLabel,
              labelText: S.of(context).onboardingEnterBirthdayLabel,
              prefixIcon: const Icon(Icons.calendar_month_outlined),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: form.birthday.displayError != null
                  ? S.of(context).onboardingEnterBirthdayLabel
                  : null,
            ),
            onTap: onDateInputClicked,
          ),
        ],
      ),
    );
  }

  void onDateInputClicked() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateInput.text = formattedDate;
      });
      ref.read(onboardingFormProvider.notifier).birthdayChanged(pickedDate);
    }
  }
}