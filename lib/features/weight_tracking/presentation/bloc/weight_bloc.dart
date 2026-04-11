import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/usecase/weight/add_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/delete_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_usecase.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  final GetWeightsUsecase _getWeightsUsecase;
  final AddWeightUsecase _addWeightUsecase;
  final DeleteWeightUsecase _deleteWeightUsecase;

  WeightBloc(
    this._getWeightsUsecase,
    this._addWeightUsecase,
    this._deleteWeightUsecase,
  ) : super(WeightInitial()) {
    on<LoadWeights>(_onLoadWeights);
    on<AddWeight>(_onAddWeight);
    on<DeleteWeight>(_onDeleteWeight);
  }

  Future<void> _onLoadWeights(
      LoadWeights event, Emitter<WeightState> emit) async {
    emit(WeightsLoading());
    try {
      final weights = await _getWeightsUsecase.getWeights();
      final sorted = List<WeightEntity>.from(weights)
        ..sort((a, b) => b.date.compareTo(a.date));
      final latestWeight = sorted.isNotEmpty ? sorted.first : null;
      emit(WeightsLoaded(weights: sorted, latestWeight: latestWeight));
    } catch (e) {
      emit(WeightError(e.toString()));
    }
  }

  Future<void> _onAddWeight(AddWeight event, Emitter<WeightState> emit) async {
    try {
      await _addWeightUsecase.addWeight(event.weight);
      final weights = await _getWeightsUsecase.getWeights();
      final sorted = List<WeightEntity>.from(weights)
        ..sort((a, b) => b.date.compareTo(a.date));
      final latestWeight = sorted.isNotEmpty ? sorted.first : null;
      emit(WeightsLoaded(weights: sorted, latestWeight: latestWeight));
    } catch (e) {
      emit(WeightError(e.toString()));
    }
  }

  Future<void> _onDeleteWeight(
      DeleteWeight event, Emitter<WeightState> emit) async {
    try {
      await _deleteWeightUsecase.deleteWeight(event.weight);
      final weights = await _getWeightsUsecase.getWeights();
      final sorted = List<WeightEntity>.from(weights)
        ..sort((a, b) => b.date.compareTo(a.date));
      final latestWeight = sorted.isNotEmpty ? sorted.first : null;
      emit(WeightsLoaded(weights: sorted, latestWeight: latestWeight));
    } catch (e) {
      emit(WeightError(e.toString()));
    }
  }
}
