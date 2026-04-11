import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/intake_dao.dart';

class IntakeDataSource {
  final IntakeDao _dao;

  IntakeDataSource(this._dao);

  Future<void> addIntake(IntakesCompanion intake) => _dao.addIntake(intake);

  Future<void> addAllIntakes(List<IntakesCompanion> intakeList) =>
      _dao.addAllIntakes(intakeList);

  Future<void> deleteIntakeFromId(String intakeId) =>
      _dao.deleteIntake(intakeId);

  Future<Intake?> updateIntake(String intakeId, double amount) async {
    await _dao.updateIntakeAmount(intakeId, amount);
    return _dao.getIntakeById(intakeId);
  }

  Future<Intake?> getIntakeById(String intakeId) =>
      _dao.getIntakeById(intakeId);

  Future<List<Intake>> getAllIntakes() => _dao.getAllIntakes();

  Future<List<Intake>> getAllIntakesByDate(
    String intakeType,
    DateTime dateTime,
  ) =>
      _dao.getIntakesByDateAndType(intakeType, dateTime);

  Future<List<Intake>> getRecentlyAddedIntake({int number = 100}) =>
      _dao.getRecentlyAdded(limit: number);
}
