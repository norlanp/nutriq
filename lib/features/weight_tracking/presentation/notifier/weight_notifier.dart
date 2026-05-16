import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/weight_tracking/presentation/notifier/weight_state.dart';

class WeightNotifier extends Notifier<WeightNotifierState> {
  final _log = Logger('WeightNotifier');

  @override
  WeightNotifierState build() {
    return const WeightNotifierState();
  }

  Future<void> loadWeights() async {
    state = const WeightNotifierState(isLoading: true);
    try {
      final weights = await ref.read(getWeightsUsecaseProvider).getWeights();
      final sorted = List<WeightEntity>.from(weights)
        ..sort((a, b) => b.date.compareTo(a.date));
      final latestWeight = sorted.isNotEmpty ? sorted.first : null;
      state = WeightNotifierState(weights: sorted, latestWeight: latestWeight);
    } catch (e) {
      _log.severe(e);
      state = WeightNotifierState(errorMessage: e.toString());
    }
  }

  Future<void> addWeight(WeightEntity weight) async {
    try {
      await ref.read(addWeightUsecaseProvider).addWeight(weight);
      await _reload();
    } catch (e) {
      _log.severe(e);
      state = WeightNotifierState(errorMessage: e.toString());
    }
  }

  Future<void> deleteWeight(WeightEntity weight) async {
    try {
      await ref.read(deleteWeightUsecaseProvider).deleteWeight(weight);
      await _reload();
    } catch (e) {
      _log.severe(e);
      state = WeightNotifierState(errorMessage: e.toString());
    }
  }

  Future<void> _reload() async {
    final weights = await ref.read(getWeightsUsecaseProvider).getWeights();
    final sorted = List<WeightEntity>.from(weights)
      ..sort((a, b) => b.date.compareTo(a.date));
    final latestWeight = sorted.isNotEmpty ? sorted.first : null;
    state = WeightNotifierState(weights: sorted, latestWeight: latestWeight);
  }
}

final weightNotifierProvider =
    NotifierProvider<WeightNotifier, WeightNotifierState>(
  WeightNotifier.new,
);