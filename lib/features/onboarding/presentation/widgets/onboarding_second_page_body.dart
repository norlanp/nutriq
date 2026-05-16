import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/validation/height_input.dart';
import 'package:nutriq/core/domain/validation/weight_input.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class OnboardingSecondPageBody extends ConsumerStatefulWidget {
  const OnboardingSecondPageBody({super.key});

  @override
  ConsumerState<OnboardingSecondPageBody> createState() =>
      _OnboardingSecondPageBodyState();
}

class _OnboardingSecondPageBodyState
    extends ConsumerState<OnboardingSecondPageBody> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final form = ref.read(onboardingFormProvider);
    _heightController.text = form.height.value;
    _weightController.text = form.weight.value;

    _heightFocusNode.addListener(() {
      if (!_heightFocusNode.hasFocus && _heightController.text.isNotEmpty) {
        ref.read(onboardingFormProvider.notifier).heightChanged(_heightController.text);
      }
    });
    _weightFocusNode.addListener(() {
      if (!_weightFocusNode.hasFocus && _weightController.text.isNotEmpty) {
        ref.read(onboardingFormProvider.notifier).weightChanged(_weightController.text);
      }
    });
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _heightFocusNode.dispose();
    _weightFocusNode.dispose();
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
          Text(S.of(context).heightLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingHeightQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          TextFormField(
              controller: _heightController,
              focusNode: _heightFocusNode,
              onChanged: (text) {
                ref.read(onboardingFormProvider.notifier).heightChanged(text);
              },
              decoration: InputDecoration(
                labelText: form.usesImperialUnits ? 'ft' : S.of(context).cmLabel,
                hintText: form.usesImperialUnits
                    ? S.of(context).onboardingHeightExampleHintFt
                    : S.of(context).onboardingHeightExampleHintCm,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _heightErrorText(context, form.height),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: form.usesImperialUnits),
              inputFormatters: [
                !form.usesImperialUnits
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+([.,]\d{0,1})?$'))
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              isSelected: [!form.usesImperialUnits, form.usesImperialUnits],
              onPressed: (int index) {
                ref
                    .read(onboardingFormProvider.notifier)
                    .unitChanged(index == 1);
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(S.of(context).cmLabel),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(S.of(context).ftLabel),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Text(S.of(context).weightLabel,
              style: Theme.of(context).textTheme.headlineSmall),
          Text(S.of(context).onboardingWeightQuestionSubtitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          TextFormField(
              controller: _weightController,
              focusNode: _weightFocusNode,
              onChanged: (text) {
                ref.read(onboardingFormProvider.notifier).weightChanged(text);
              },
              decoration: InputDecoration(
                labelText: form.usesImperialUnits
                    ? S.of(context).lbsLabel
                    : S.of(context).kgLabel,
                hintText: form.usesImperialUnits
                    ? S.of(context).onboardingWeightExampleHintLbs
                    : S.of(context).onboardingWeightExampleHintKg,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _weightErrorText(context, form.weight),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              isSelected: [!form.usesImperialUnits, form.usesImperialUnits],
              onPressed: (int index) {
                ref
                    .read(onboardingFormProvider.notifier)
                    .unitChanged(index == 1);
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(S.of(context).kgLabel),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(S.of(context).lbsLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? _heightErrorText(BuildContext context, HeightInput height) {
    if (!height.isPure && height.displayError == HeightInputError.empty) {
      return S.of(context).onboardingWrongHeightLabel;
    }
    if (!height.isPure && height.displayError == HeightInputError.invalidFormat) {
      return S.of(context).onboardingWrongHeightLabel;
    }
    if (!height.isPure && height.displayError == HeightInputError.tooSmall) {
      return S.of(context).onboardingWrongHeightLabel;
    }
    if (!height.isPure && height.displayError == HeightInputError.tooLarge) {
      return S.of(context).onboardingWrongHeightLabel;
    }
    return null;
  }

  String? _weightErrorText(BuildContext context, WeightInput weight) {
    if (!weight.isPure && weight.displayError == WeightInputError.empty) {
      return S.of(context).onboardingWrongWeightLabel;
    }
    if (!weight.isPure && weight.displayError == WeightInputError.invalidFormat) {
      return S.of(context).onboardingWrongWeightLabel;
    }
    if (!weight.isPure && weight.displayError == WeightInputError.tooSmall) {
      return S.of(context).onboardingWrongWeightLabel;
    }
    if (!weight.isPure && weight.displayError == WeightInputError.tooLarge) {
      return S.of(context).onboardingWrongWeightLabel;
    }
    return null;
  }
}