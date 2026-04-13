import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart';

class GetBloodGlucoseAverageUsecase {
  final BloodGlucoseRepository _bloodGlucoseRepository;

  GetBloodGlucoseAverageUsecase(this._bloodGlucoseRepository);

  Future<double> getAverage(DateTime startDate, DateTime endDate) =>
      _bloodGlucoseRepository.getBloodGlucoseAverage(startDate, endDate);
}
