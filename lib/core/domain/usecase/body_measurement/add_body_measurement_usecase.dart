import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart';

class AddBodyMeasurementUsecase {
  final BodyMeasurementRepository _repository;

  AddBodyMeasurementUsecase(this._repository);

  Future<void> call(BodyMeasurementEntity entity) =>
      _repository.addBodyMeasurement(entity);
}
