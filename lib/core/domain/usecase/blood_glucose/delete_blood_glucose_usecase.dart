import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart';

class DeleteBloodGlucoseUsecase {
  final BloodGlucoseRepository _bloodGlucoseRepository;

  DeleteBloodGlucoseUsecase(this._bloodGlucoseRepository);

  Future<void> deleteBloodGlucose(BloodGlucoseEntity entity) =>
      _bloodGlucoseRepository.deleteBloodGlucose(entity);
}
