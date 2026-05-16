import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/validation/boolean_input.dart';
import 'package:nutriq/core/domain/validation/height_input.dart';
import 'package:nutriq/core/domain/validation/required_date_input.dart';
import 'package:nutriq/core/domain/validation/required_selection_input.dart';
import 'package:nutriq/core/domain/validation/weight_input.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_activity_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_gender_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_goal_selection_entity.dart';

class OnboardingFormState {
  final BooleanInput privacyAccepted;
  final RequiredSelectionInput<UserGenderSelectionEntity> gender;
  final RequiredDateInput birthday;
  final HeightInput height;
  final WeightInput weight;
  final RequiredSelectionInput<UserActivitySelectionEntity> activity;
  final RequiredSelectionInput<UserGoalSelectionEntity> goal;
  final bool usesImperialUnits;
  final bool acceptDataCollection;

  const OnboardingFormState({
    this.privacyAccepted = const BooleanInput.pure(),
    this.gender = const RequiredSelectionInput.pure(),
    this.birthday = const RequiredDateInput.pure(),
    this.height = const HeightInput.pure(),
    this.weight = const WeightInput.pure(),
    this.activity = const RequiredSelectionInput.pure(),
    this.goal = const RequiredSelectionInput.pure(),
    this.usesImperialUnits = false,
    this.acceptDataCollection = false,
  });

  bool get introPageValid =>
      privacyAccepted.isValid && privacyAccepted.value == true;

  bool get firstPageValid => gender.isValid && birthday.isValid;

  bool get secondPageValid => height.isValid && weight.isValid;

  bool get thirdPageValid => activity.isValid;

  bool get fourthPageValid => goal.isValid;

  OnboardingFormState copyWith({
    BooleanInput? privacyAccepted,
    RequiredSelectionInput<UserGenderSelectionEntity>? gender,
    RequiredDateInput? birthday,
    HeightInput? height,
    WeightInput? weight,
    RequiredSelectionInput<UserActivitySelectionEntity>? activity,
    RequiredSelectionInput<UserGoalSelectionEntity>? goal,
    bool? usesImperialUnits,
    bool? acceptDataCollection,
  }) {
    return OnboardingFormState(
      privacyAccepted: privacyAccepted ?? this.privacyAccepted,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      activity: activity ?? this.activity,
      goal: goal ?? this.goal,
      usesImperialUnits: usesImperialUnits ?? this.usesImperialUnits,
      acceptDataCollection: acceptDataCollection ?? this.acceptDataCollection,
    );
  }
}

class OnboardingFormNotifier extends Notifier<OnboardingFormState> {
  @override
  OnboardingFormState build() => const OnboardingFormState();

  void privacyAcceptedChanged(bool value) {
    state = state.copyWith(
      privacyAccepted: BooleanInput.dirty(value),
      acceptDataCollection: state.acceptDataCollection,
    );
  }

  void dataCollectionAcceptedChanged(bool value) {
    state = state.copyWith(acceptDataCollection: value);
  }

  void genderChanged(UserGenderSelectionEntity? value) {
    state = state.copyWith(
      gender: RequiredSelectionInput.dirty(value),
    );
  }

  void birthdayChanged(DateTime? value) {
    state = state.copyWith(
      birthday: RequiredDateInput.dirty(value),
    );
  }

  void heightChanged(String value) {
    state = state.copyWith(
      height: HeightInput.dirty(value: value, isImperial: state.usesImperialUnits),
    );
  }

  void weightChanged(String value) {
    state = state.copyWith(
      weight: WeightInput.dirty(value: value, isImperial: state.usesImperialUnits),
    );
  }

  void unitChanged(bool usesImperial) {
    final currentHeightValue = state.height.value;
    final currentWeightValue = state.weight.value;
    state = state.copyWith(
      usesImperialUnits: usesImperial,
      height:currentHeightValue.isEmpty
          ? HeightInput.pure(isImperial: usesImperial)
          : HeightInput.dirty(value: currentHeightValue, isImperial: usesImperial),
      weight: currentWeightValue.isEmpty
          ? WeightInput.pure(isImperial: usesImperial)
          : WeightInput.dirty(value: currentWeightValue, isImperial: usesImperial),
    );
  }

  void activityChanged(UserActivitySelectionEntity? value) {
    state = state.copyWith(
      activity: RequiredSelectionInput.dirty(value),
    );
  }

  void goalChanged(UserGoalSelectionEntity? value) {
    state = state.copyWith(
      goal: RequiredSelectionInput.dirty(value),
    );
  }
}

final onboardingFormProvider =
    NotifierProvider<OnboardingFormNotifier, OnboardingFormState>(
  OnboardingFormNotifier.new,
);