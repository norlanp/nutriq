import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';

void main() {
  group('MacroCalc', () {
    group('getTotalCarbsGoal', () {
      test('uses default 60% when no user goal provided', () {
        final result = MacroCalc.getTotalCarbsGoal(2000);
        expect(result, closeTo(2000 * 0.6 / 4.0, 0.01));
      });

      test('uses user-provided percentage', () {
        final result = MacroCalc.getTotalCarbsGoal(2000, userCarbsGoal: 0.45);
        expect(result, closeTo(2000 * 0.45 / 4.0, 0.01));
      });

      test('scales with calorie target', () {
        final result1500 = MacroCalc.getTotalCarbsGoal(1500);
        final result3000 = MacroCalc.getTotalCarbsGoal(3000);
        expect(result3000, closeTo(result1500 * 2, 0.01));
      });
    });

    group('getTotalFatsGoal', () {
      test('uses default 25% when no user goal provided', () {
        final result = MacroCalc.getTotalFatsGoal(2000);
        expect(result, closeTo(2000 * 0.25 / 9.0, 0.01));
      });

      test('uses user-provided percentage', () {
        final result = MacroCalc.getTotalFatsGoal(2000, userFatsGoal: 0.35);
        expect(result, closeTo(2000 * 0.35 / 9.0, 0.01));
      });
    });

    group('getTotalProteinsGoal', () {
      test('uses default 15% when no user goal provided', () {
        final result = MacroCalc.getTotalProteinsGoal(2000);
        expect(result, closeTo(2000 * 0.15 / 4.0, 0.01));
      });

      test('uses user-provided percentage', () {
        final result = MacroCalc.getTotalProteinsGoal(2000,
            userProteinsGoal: 0.25);
        expect(result, closeTo(2000 * 0.25 / 4.0, 0.01));
      });
    });

    test('all macros sum to approximately the calorie goal by default', () {
      final kcal = 2000.0;
      final carbs = MacroCalc.getTotalCarbsGoal(kcal);
      final fats = MacroCalc.getTotalFatsGoal(kcal);
      final proteins = MacroCalc.getTotalProteinsGoal(kcal);

      final totalFromMacros = carbs * 4 + fats * 9 + proteins * 4;
      expect(totalFromMacros, closeTo(kcal, 1.0));
    });
  });
}