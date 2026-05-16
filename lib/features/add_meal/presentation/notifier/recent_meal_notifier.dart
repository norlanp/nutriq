import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/recent_meal_state.dart';

class RecentMealNotifier extends Notifier<RecentMealState> {
  final _log = Logger('RecentMealNotifier');

  @override
  RecentMealState build() {
    return const RecentMealState();
  }

  Future<void> loadRecentMeals(String searchString) async {
    state = const RecentMealState(isLoading: true);
    try {
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      final recentIntake =
          await ref.read(getIntakeUsecaseProvider).getRecentIntake();
      final searchLower = searchString.toLowerCase();
      final seenNames = <String>{};
      final dedupedIntakes = <IntakeEntity>[];
      for (final intake in recentIntake) {
        final name = intake.meal.name?.toLowerCase() ?? '';
        if (seenNames.add(name)) {
          dedupedIntakes.add(intake);
        }
        if (dedupedIntakes.length >= 10) break;
      }
      final filteredMeals = searchLower.isEmpty
          ? dedupedIntakes.map((intake) => intake.meal).toList()
          : dedupedIntakes
              .where(_matchesSearchString(searchLower))
              .map((intake) => intake.meal)
              .toList();
      state = RecentMealState(
        recentMeals: filteredMeals,
        usesImperialUnits: config.usesImperialUnits,
      );
    } catch (error) {
      _log.severe(error);
      state = const RecentMealState(hasError: true);
    }
  }

  bool Function(IntakeEntity) _matchesSearchString(String searchString) {
    return (intake) =>
        (intake.meal.name?.toLowerCase().contains(searchString) ?? false) ||
        (intake.meal.brands?.toLowerCase().contains(searchString) ?? false);
  }
}

final recentMealNotifierProvider =
    NotifierProvider<RecentMealNotifier, RecentMealState>(
        RecentMealNotifier.new);