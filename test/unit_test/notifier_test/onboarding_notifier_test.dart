import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_data_mask_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_activity_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_gender_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_goal_selection_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_notifier.dart';

void main() {
  group('OnboardingNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is default UserDataMaskEntity', () {
      final state = container.read(onboardingNotifierProvider);
      expect(state.gender, isNull);
      expect(state.birthday, isNull);
      expect(state.height, isNull);
      expect(state.weight, isNull);
      expect(state.activity, isNull);
      expect(state.goal, isNull);
      expect(state.acceptDataCollection, false);
      expect(state.usesImperialUnits, false);
    });

    test('updateUserSelection updates state', () {
      final selection = UserDataMaskEntity(
        gender: UserGenderSelectionEntity.genderMale,
        birthday: DateTime(2000, 1, 1),
        height: 180.0,
        weight: 80.0,
        activity: UserActivitySelectionEntity.sedentary,
        goal: UserGoalSelectionEntity.maintainWeight,
      );
      container
          .read(onboardingNotifierProvider.notifier)
          .updateUserSelection(selection);

      final state = container.read(onboardingNotifierProvider);
      expect(state.gender, UserGenderSelectionEntity.genderMale);
      expect(state.height, 180.0);
      expect(state.weight, 80.0);
    });

    test('checkDataProvided returns false when incomplete', () {
      final state = container.read(onboardingNotifierProvider);
      expect(state.checkDataProvided(), false);
    });

    test('checkDataProvided returns true when all fields set', () {
      final selection = UserDataMaskEntity(
        gender: UserGenderSelectionEntity.genderFemale,
        birthday: DateTime(1995, 6, 15),
        height: 165.0,
        weight: 65.0,
        activity: UserActivitySelectionEntity.active,
        goal: UserGoalSelectionEntity.loseWeight,
      );
      container
          .read(onboardingNotifierProvider.notifier)
          .updateUserSelection(selection);

      final state = container.read(onboardingNotifierProvider);
      expect(state.checkDataProvided(), true);
    });

    test('toUserEntity returns null when incomplete', () {
      final state = container.read(onboardingNotifierProvider);
      expect(state.toUserEntity(), isNull);
    });

    test('toUserEntity returns UserEntity when complete', () {
      final selection = UserDataMaskEntity(
        gender: UserGenderSelectionEntity.genderMale,
        birthday: DateTime(1990, 1, 1),
        height: 180.0,
        weight: 80.0,
        activity: UserActivitySelectionEntity.sedentary,
        goal: UserGoalSelectionEntity.maintainWeight,
      );
      container
          .read(onboardingNotifierProvider.notifier)
          .updateUserSelection(selection);

      final state = container.read(onboardingNotifierProvider);
      final user = state.toUserEntity();
      expect(user, isNotNull);
      expect(user!.heightCM, 180.0);
      expect(user.weightKG, 80.0);
    });

    test('getOverviewCalorieGoal returns null when incomplete', () {
      final result = container
          .read(onboardingNotifierProvider.notifier)
          .getOverviewCalorieGoal();
      expect(result, isNull);
    });

    test('getOverviewCalorieGoal returns value when complete', () {
      final selection = UserDataMaskEntity(
        gender: UserGenderSelectionEntity.genderMale,
        birthday: DateTime(1990, 1, 1),
        height: 180.0,
        weight: 80.0,
        activity: UserActivitySelectionEntity.sedentary,
        goal: UserGoalSelectionEntity.maintainWeight,
      );
      container
          .read(onboardingNotifierProvider.notifier)
          .updateUserSelection(selection);

      final result = container
          .read(onboardingNotifierProvider.notifier)
          .getOverviewCalorieGoal();
      expect(result, isNotNull);
      expect(result!, greaterThan(0));
    });
  });
}