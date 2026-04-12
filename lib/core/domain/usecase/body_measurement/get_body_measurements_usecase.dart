import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart';

class GetBodyMeasurementsUsecase {
  final BodyMeasurementRepository _repository;

  GetBodyMeasurementsUsecase(this._repository);

  Future<List<BodyMeasurementEntity>> getByDate(DateTime date) =>
      _repository.getByDate(date);

  Future<List<BodyMeasurementEntity>> getBetweenDates(
          DateTime startDate, DateTime endDate) =>
      _repository.getBetweenDates(startDate, endDate);

  Future<BodyMeasurementEntity?> getLatest(int userId) =>
      _repository.getLatest(userId);
}
