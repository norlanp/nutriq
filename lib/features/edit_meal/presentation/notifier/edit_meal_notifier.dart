import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/edit_meal/presentation/notifier/edit_meal_state.dart';

class EditMealNotifier extends AsyncNotifier<EditMealState> {
  @override
  Future<EditMealState> build() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return EditMealState(usesImperialUnits: config.usesImperialUnits);
  }
}

final editMealNotifierProvider =
    AsyncNotifierProvider<EditMealNotifier, EditMealState>(EditMealNotifier.new);