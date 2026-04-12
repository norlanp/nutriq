import 'package:nutriq/core/domain/entity/water_entity.dart';

abstract class WaterRepository {
  Future<List<WaterEntity>> getWaterByDate(DateTime date);

  Future<int> getDailyWaterTotal(DateTime date);

  Future<List<WaterEntity>> getWaterBetweenDates(
    DateTime startDate,
    DateTime endDate,
  );

  Future<void> addWater(WaterEntity entity);

  Future<void> deleteWater(WaterEntity entity);
}
