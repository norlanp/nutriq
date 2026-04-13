import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';

abstract class BloodGlucoseRepository {
  Future<void> addBloodGlucose(BloodGlucoseEntity entity);

  Future<void> deleteBloodGlucose(BloodGlucoseEntity entity);

  Future<List<BloodGlucoseEntity>> getBloodGlucoseByDate(DateTime date);

  Future<List<BloodGlucoseEntity>> getBloodGlucoseBetweenDates(
    DateTime startDate,
    DateTime endDate,
  );

  Future<double> getBloodGlucoseAverage(DateTime startDate, DateTime endDate);
}
