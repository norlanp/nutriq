import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart';

class GetBloodGlucoseUsecase {
  final BloodGlucoseRepository _bloodGlucoseRepository;

  GetBloodGlucoseUsecase(this._bloodGlucoseRepository);

  Future<List<BloodGlucoseEntity>> getBloodGlucoseByDate(DateTime date) =>
      _bloodGlucoseRepository.getBloodGlucoseByDate(date);

  Future<List<BloodGlucoseEntity>> getBloodGlucoseBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _bloodGlucoseRepository.getBloodGlucoseBetweenDates(startDate, endDate);
}
