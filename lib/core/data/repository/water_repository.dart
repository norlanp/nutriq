import 'package:nutriq/core/data/data_source/water_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/repository/water_repository.dart' as domain;

class WaterRepository implements domain.WaterRepository {
  final WaterDataSource _waterDataSource;

  WaterRepository(this._waterDataSource);

  @override
  Future<List<WaterEntity>> getWaterByDate(DateTime date) async {
    final entries = await _waterDataSource.getByDate(date);
    return entries.map(mapWaterToEntity).toList();
  }

  @override
  Future<int> getDailyWaterTotal(DateTime date) =>
      _waterDataSource.getDailyTotal(date);

  @override
  Future<List<WaterEntity>> getWaterBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await _waterDataSource.getBetweenDates(startDate, endDate);
    return entries.map(mapWaterToEntity).toList();
  }

  @override
  Future<void> addWater(WaterEntity entity) async {
    final companion = mapWaterEntityToCompanion(entity);
    await _waterDataSource.insertEntry(companion);
  }

  @override
  Future<void> deleteWater(WaterEntity entity) async {
    final companion = mapWaterEntityToCompanion(entity);
    await _waterDataSource.deleteEntry(companion);
  }
}
