import 'package:nutriq/core/data/data_source/weight_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/repository/weight_repository.dart' as domain;

class WeightRepository implements domain.WeightRepository {
  final WeightDataSource _weightDataSource;

  WeightRepository(this._weightDataSource);

  @override
  Future<List<WeightEntity>> getWeights() async {
    final weights = await _weightDataSource.getAllWeights();
    return weights.map(mapWeightToEntity).toList();
  }

  @override
  Future<List<WeightEntity>> getWeightsBetweenDates(
    DateTime start,
    DateTime end,
  ) async {
    final weights = await _weightDataSource.getWeightsBetweenDates(start, end);
    return weights.map(mapWeightToEntity).toList();
  }

  @override
  Future<WeightEntity?> getLatestWeight() async {
    final weight = await _weightDataSource.getLatestWeight();
    return weight == null ? null : mapWeightToEntity(weight);
  }

  @override
  Future<void> addWeight(WeightEntity entity) async {
    final companion = mapWeightEntityToCompanion(entity);
    await _weightDataSource.insertWeight(companion);
  }

  @override
  Future<void> deleteWeight(WeightEntity entity) async {
    final companion = mapWeightEntityToCompanion(entity);
    await _weightDataSource.deleteWeight(companion);
  }
}
