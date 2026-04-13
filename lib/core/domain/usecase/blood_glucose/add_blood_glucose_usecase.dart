import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart';

class AddBloodGlucoseUsecase {
  final BloodGlucoseRepository _bloodGlucoseRepository;

  AddBloodGlucoseUsecase(this._bloodGlucoseRepository);

  Future<void> addBloodGlucose(BloodGlucoseEntity entity) =>
      _bloodGlucoseRepository.addBloodGlucose(entity);
}
