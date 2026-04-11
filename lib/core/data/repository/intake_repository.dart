import 'package:nutriq/core/data/data_source/intake_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/repository/intake_repository.dart' as domain;

class IntakeRepository implements domain.IntakeRepository {
  final IntakeDataSource _intakeDataSource;
  final MealDao _mealDao;

  IntakeRepository(this._intakeDataSource, this._mealDao);

  @override
  Future<void> addIntake(IntakeEntity intakeEntity) async {
    final mealCompanion = mapMealEntityToCompanion(intakeEntity.meal);
    await _mealDao.addMeal(mealCompanion);
    final companion = mapIntakeEntityToCompanion(intakeEntity);
    await _intakeDataSource.addIntake(companion);
  }

  Future<void> addAllIntakesData(
      List<IntakesCompanion> intakeCompanions) async {
    await _intakeDataSource.addAllIntakes(intakeCompanions);
  }

  @override
  Future<void> deleteIntake(IntakeEntity intakeEntity) async {
    await _intakeDataSource.deleteIntakeFromId(intakeEntity.id);
  }

  @override
  Future<IntakeEntity?> updateIntake(
    String intakeId,
    Map<String, dynamic> fields,
  ) async {
    if (fields.containsKey('amount')) {
      final amount = fields['amount'] as double;
      await _intakeDataSource.updateIntake(intakeId, amount);
    }
    final result = await _intakeDataSource.getIntakeById(intakeId);
    return result == null ? null : await _mapIntake(result);
  }

  Future<List<Intake>> getAllIntakesData() async {
    return await _intakeDataSource.getAllIntakes();
  }

  @override
  Future<List<IntakeEntity>> getIntakeByDateAndType(
    IntakeTypeEntity intakeType,
    DateTime date,
  ) async {
    final intakeList = await _intakeDataSource.getAllIntakesByDate(
      mapIntakeTypeEntityToString(intakeType),
      date,
    );

    return Future.wait(intakeList.map((i) => _mapIntake(i)));
  }

  @override
  Future<List<IntakeEntity>> getRecentIntake() async {
    final intakeList = await _intakeDataSource.getRecentlyAddedIntake();

    return Future.wait(intakeList.map((i) => _mapIntake(i)));
  }

  @override
  Future<IntakeEntity?> getIntakeById(String intakeId) async {
    final result = await _intakeDataSource.getIntakeById(intakeId);
    return result == null ? null : await _mapIntake(result);
  }

  Future<IntakeEntity> _mapIntake(Intake intake) async {
    final meal = await _mealDao.getMealById(intake.mealId);
    if (meal == null) {
      throw StateError(
          'Meal not found for intake ${intake.id}: mealId=${intake.mealId}');
    }
    return mapIntakeToEntity(intake, meal);
  }
}
