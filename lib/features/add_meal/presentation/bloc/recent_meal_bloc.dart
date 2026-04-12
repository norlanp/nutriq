import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

part 'recent_meal_event.dart';
part 'recent_meal_state.dart';

class RecentMealBloc extends Bloc<RecentMealEvent, RecentMealState> {
  final log = Logger('RecentMealBloc');

  final GetIntakeUsecase _getIntakeUsecase;
  final GetConfigUsecase _getConfigUsecase;

  RecentMealBloc(this._getIntakeUsecase, this._getConfigUsecase)
      : super(RecentMealInitial()) {
    on<LoadRecentMealEvent>((event, emit) async {
      emit(RecentMealLoadingState());
      try {
        final config = await _getConfigUsecase.getConfig();
        final recentIntake = await _getIntakeUsecase.getRecentIntake();
        final searchString = (event.searchString).toLowerCase();

        // Deduplicate by meal name, keeping the most recent entry
        final seenNames = <String>{};
        final dedupedIntakes = <IntakeEntity>[];
        for (final intake in recentIntake) {
          final name = intake.meal.name?.toLowerCase() ?? '';
          if (seenNames.add(name)) {
            dedupedIntakes.add(intake);
          }
          if (dedupedIntakes.length >= 10) break;
        }

        if (searchString.isEmpty) {
          emit(RecentMealLoadedState(
              recentMeals: dedupedIntakes.map((intake) => intake.meal).toList(),
              usesImperialUnits: config.usesImperialUnits));
        } else {
          emit(RecentMealLoadedState(
              recentMeals: dedupedIntakes
                  .where(matchesSearchString(searchString))
                  .map((intake) => intake.meal)
                  .toList(),
              usesImperialUnits: config.usesImperialUnits));
        }
      } catch (error) {
        log.severe(error);
        emit(RecentMealFailedState());
      }
    });
  }

  bool Function(IntakeEntity) matchesSearchString(String searchString) {
    return (intake) =>
        (intake.meal.name?.toLowerCase().contains(searchString) ?? false) ||
        (intake.meal.brands?.toLowerCase().contains(searchString) ?? false);
  }
}
