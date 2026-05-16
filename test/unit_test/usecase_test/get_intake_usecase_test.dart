import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';

import '../../helpers/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late GetIntakeUsecase usecase;
  late MockIntakeRepository mockRepo;

  setUp(() {
    mockRepo = MockIntakeRepository();
    usecase = GetIntakeUsecase(mockRepo);
  });

  final testDate = DateTime(2024, 6, 15);

  group('GetIntakeUsecase', () {
    test('getIntakeById returns intake from repo', () async {
      when(() => mockRepo.getIntakeById('intake-1'))
          .thenAnswer((_) async => null);

      await usecase.getIntakeById('intake-1');

      verify(() => mockRepo.getIntakeById('intake-1')).called(1);
    });

    test('getRecentIntake delegates to repo', () async {
      when(() => mockRepo.getRecentIntake())
          .thenAnswer((_) async => []);

      await usecase.getRecentIntake();

      verify(() => mockRepo.getRecentIntake()).called(1);
    });

    test('getBreakfastIntakeByDay passes correct type', () async {
      when(() => mockRepo.getIntakeByDateAndType(any(), any()))
          .thenAnswer((_) async => []);

      await usecase.getBreakfastIntakeByDay(testDate);

      verify(() => mockRepo.getIntakeByDateAndType(
          IntakeTypeEntity.breakfast, testDate)).called(1);
    });

    test('getLunchIntakeByDay passes correct type', () async {
      when(() => mockRepo.getIntakeByDateAndType(any(), any()))
          .thenAnswer((_) async => []);

      await usecase.getLunchIntakeByDay(testDate);

      verify(() => mockRepo.getIntakeByDateAndType(
          IntakeTypeEntity.lunch, testDate)).called(1);
    });

    test('getDinnerIntakeByDay passes correct type', () async {
      when(() => mockRepo.getIntakeByDateAndType(any(), any()))
          .thenAnswer((_) async => []);

      await usecase.getDinnerIntakeByDay(testDate);

      verify(() => mockRepo.getIntakeByDateAndType(
          IntakeTypeEntity.dinner, testDate)).called(1);
    });

    test('getSnackIntakeByDay passes correct type', () async {
      when(() => mockRepo.getIntakeByDateAndType(any(), any()))
          .thenAnswer((_) async => []);

      await usecase.getSnackIntakeByDay(testDate);

      verify(() => mockRepo.getIntakeByDateAndType(
          IntakeTypeEntity.snack, testDate)).called(1);
    });
  });
}