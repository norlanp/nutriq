import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';

import '../../helpers/mocks.dart';

void main() {
  late AddConfigUsecase addUsecase;
  late GetConfigUsecase getUsecase;
  late MockConfigRepository mockRepo;

  setUp(() {
    mockRepo = MockConfigRepository();
    addUsecase = AddConfigUsecase(mockRepo);
    getUsecase = GetConfigUsecase(mockRepo);
  });

  final defaultConfig = ConfigEntity(
    hasAcceptedDisclaimer: false,
    hasAcceptedPolicy: false,
    hasAcceptedSendAnonymousData: false,
    appTheme: AppThemeEntity.system,
  );

  group('AddConfigUsecase', () {
    test('setConfigDisclaimer delegates to repo', () async {
      when(() => mockRepo.setConfigDisclaimer(true))
          .thenAnswer((_) async {});

      await addUsecase.setConfigDisclaimer(true);

      verify(() => mockRepo.setConfigDisclaimer(true)).called(1);
    });

    test('setConfigHasAcceptedAnonymousData delegates to repo', () async {
      when(() => mockRepo.setConfigHasAcceptedAnonymousData(true))
          .thenAnswer((_) async {});

      await addUsecase.setConfigHasAcceptedAnonymousData(true);

      verify(() => mockRepo.setConfigHasAcceptedAnonymousData(true)).called(1);
    });

    test('setConfigAppTheme delegates to repo', () async {
      when(() => mockRepo.setConfigAppTheme(AppThemeEntity.dark))
          .thenAnswer((_) async {});

      await addUsecase.setConfigAppTheme(AppThemeEntity.dark);

      verify(() => mockRepo.setConfigAppTheme(AppThemeEntity.dark)).called(1);
    });

    test('setConfigUsesImperialUnits delegates to repo', () async {
      when(() => mockRepo.setConfigUsesImperialUnits(true))
          .thenAnswer((_) async {});

      await addUsecase.setConfigUsesImperialUnits(true);

      verify(() => mockRepo.setConfigUsesImperialUnits(true)).called(1);
    });

    test('setConfigKcalAdjustment delegates to repo', () async {
      when(() => mockRepo.setConfigKcalAdjustment(100))
          .thenAnswer((_) async {});

      await addUsecase.setConfigKcalAdjustment(100);

      verify(() => mockRepo.setConfigKcalAdjustment(100)).called(1);
    });

    test('getConfigTDEEMethod delegates to repo', () async {
      when(() => mockRepo.getConfigTDEEMethod())
          .thenAnswer((_) async => TDEEMethodEntity.mifflinStJeor);

      final result = await addUsecase.getConfigTDEEMethod();

      expect(result, TDEEMethodEntity.mifflinStJeor);
    });

    test('setNetCarbsEnabled delegates to repo', () async {
      when(() => mockRepo.setNetCarbsEnabled(true))
          .thenAnswer((_) async {});

      await addUsecase.setNetCarbsEnabled(true);

      verify(() => mockRepo.setNetCarbsEnabled(true)).called(1);
    });

    test('setStepBonusEnabled delegates to repo', () async {
      when(() => mockRepo.setStepBonusEnabled(true))
          .thenAnswer((_) async {});

      await addUsecase.setStepBonusEnabled(true);

      verify(() => mockRepo.setStepBonusEnabled(true)).called(1);
    });
  });

  group('GetConfigUsecase', () {
    test('getConfig returns config from repo', () async {
      when(() => mockRepo.getConfig())
          .thenAnswer((_) async => defaultConfig);

      final result = await getUsecase.getConfig();

      expect(result, defaultConfig);
      verify(() => mockRepo.getConfig()).called(1);
    });
  });
}