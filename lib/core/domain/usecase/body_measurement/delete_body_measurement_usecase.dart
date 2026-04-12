import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart';

class DeleteBodyMeasurementUsecase {
  final BodyMeasurementRepository _repository;

  DeleteBodyMeasurementUsecase(this._repository);

  Future<void> call(BodyMeasurementEntity entity) =>
      _repository.deleteBodyMeasurement(entity);
}
