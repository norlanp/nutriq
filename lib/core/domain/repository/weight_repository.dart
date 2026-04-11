import 'package:nutriq/core/domain/entity/weight_entity.dart';

abstract class WeightRepository {
  Future<List<WeightEntity>> getWeights();

  Future<List<WeightEntity>> getWeightsBetweenDates(
    DateTime start,
    DateTime end,
  );

  Future<WeightEntity?> getLatestWeight();

  Future<void> addWeight(WeightEntity entity);

  Future<void> deleteWeight(WeightEntity entity);
}
