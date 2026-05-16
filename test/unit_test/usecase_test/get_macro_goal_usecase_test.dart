import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';

class MockConfigRepository extends Mock implements ConfigRepository {}

void main() {
  late GetMacroGoalUsecase usecase;
  late MockConfigRepository mockConfigRepo;

  setUp(() {
    mockConfigRepo = MockConfigRepository();
    usecase = GetMacroGoalUsecase(mockConfigRepo);
  });

  final defaultConfig = ConfigEntity(
    false,
    false,
    false,
    AppThemeEntity.system,
  );

  final customMacroConfig = ConfigEntity(
    true,
    true,
    true,
    AppThemeEntity.dark,
    userCarbGoalPct: 0.5,
    userProteinGoalPct: 0.3,
    userFatGoalPct: 0.2,
  );

  group('GetMacroGoalUsecase', () {
    test('getCarbsGoal uses default percentage when no user goal set', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => defaultConfig);
      final result = await usecase.getCarbsGoal(2000);
      expect(result, closeTo(2000 * 0.6 / 4.0, 0.01));
    });

    test('getCarbsGoal uses user percentage when set', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => customMacroConfig);
      final result = await usecase.getCarbsGoal(2000);
      expect(result, closeTo(2000 * 0.5 / 4.0, 0.01));
    });

    test('getFatsGoal uses default percentage when no user goal set', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => defaultConfig);
      final result = await usecase.getFatsGoal(2000);
      expect(result, closeTo(2000 * 0.25 / 9.0, 0.01));
    });

    test('getFatsGoal uses user percentage when set', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => customMacroConfig);
      final result = await usecase.getFatsGoal(2000);
      expect(result, closeTo(2000 * 0.2 / 9.0, 0.01));
    });

    test('getProteinsGoal uses default percentage when no user goal set',
        () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => defaultConfig);
      final result = await usecase.getProteinsGoal(2000);
      expect(result, closeTo(2000 * 0.15 / 4.0, 0.01));
    });

    test('getProteinsGoal uses user percentage when set', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => customMacroConfig);
      final result = await usecase.getProteinsGoal(2000);
      expect(result, closeTo(2000 * 0.3 / 4.0, 0.01));
    });

    test('goals scale with calorie target', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer((_) async => defaultConfig);
      final result1500 = await usecase.getCarbsGoal(1500);
      final result3000 = await usecase.getCarbsGoal(3000);
      expect(result3000, closeTo(result1500 * 2, 0.01));
    });
  });
}