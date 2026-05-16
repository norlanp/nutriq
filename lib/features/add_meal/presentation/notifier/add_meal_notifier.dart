import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/add_meal_state.dart';

class AddMealNotifier extends AsyncNotifier<AddMealState> {
  @override
  Future<AddMealState> build() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return AddMealState(usesImperialUnits: config.usesImperialUnits);
  }
}

final addMealNotifierProvider =
    AsyncNotifierProvider<AddMealNotifier, AddMealState>(
        AddMealNotifier.new);