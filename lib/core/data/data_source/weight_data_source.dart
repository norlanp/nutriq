import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/weight_dao.dart';

class WeightDataSource {
  final WeightDao _dao;

  WeightDataSource(this._dao);

  Future<List<Weight>> getAllWeights() => _dao.getAllWeights();

  Future<Weight?> getWeightById(int id) => _dao.getWeightById(id);

  Future<List<Weight>> getWeightsBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getWeightsBetweenDates(startDate, endDate);

  Future<Weight?> getLatestWeight() => _dao.getLatestWeight();

  Future<void> insertWeight(WeightsCompanion weight) =>
      _dao.insertWeight(weight);

  Future<void> deleteWeight(WeightsCompanion weight) =>
      _dao.deleteWeight(weight);
}
