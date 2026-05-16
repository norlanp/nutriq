import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/add_meal_bloc.dart';

class MockConfigRepository extends Mock implements ConfigRepository {}

void main() {
  late MockConfigRepository mockConfigRepo;
  late GetConfigUsecase getConfigUsecase;

  setUp(() {
    mockConfigRepo = MockConfigRepository();
    getConfigUsecase = GetConfigUsecase(mockConfigRepo);
  });

  group('AddMealBloc', () {
    blocTest<AddMealBloc, AddMealState>(
      'emits [AddMealLoadingState, AddMealLoadedState] when InitializeAddMealEvent succeeds',
      build: () {
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(
            hasAcceptedDisclaimer: true,
            hasAcceptedPolicy: true,
            hasAcceptedSendAnonymousData: true,
            appTheme: AppThemeEntity.dark,
            usesImperialUnits: true,
          ),
        );
        return AddMealBloc(getConfigUsecase);
      },
      act: (bloc) => bloc.add(InitializeAddMealEvent()),
      expect: () => [
        AddMealLoadingState(),
        AddMealLoadedState(usesImperialUnits: true),
      ],
    );

    blocTest<AddMealBloc, AddMealState>(
      'emits loaded state with usesImperialUnits false by default',
      build: () {
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(
            hasAcceptedDisclaimer: false,
            hasAcceptedPolicy: false,
            hasAcceptedSendAnonymousData: false,
            appTheme: AppThemeEntity.system,
          ),
        );
        return AddMealBloc(getConfigUsecase);
      },
      act: (bloc) => bloc.add(InitializeAddMealEvent()),
      expect: () => [
        AddMealLoadingState(),
        const AddMealLoadedState(usesImperialUnits: false),
      ],
    );
  });
}