import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

abstract class IntakeRepository {
  Future<void> addIntake(IntakeEntity intakeEntity);

  Future<void> deleteIntake(IntakeEntity intakeEntity);

  Future<IntakeEntity?> updateIntake(
    String intakeId,
    Map<String, dynamic> fields,
  );

  Future<List<IntakeEntity>> getIntakeByDateAndType(
    IntakeTypeEntity intakeType,
    DateTime date,
  );

  Future<List<IntakeEntity>> getRecentIntake();

  Future<IntakeEntity?> getIntakeById(String intakeId);

  Future<List<IntakeEntity>> getIntakesByDate(DateTime date);

  Future<List<IntakeEntity>> getAllIntakesOrderedByTime();

  Future<void> importAllFromJson(List<Map<String, dynamic>> jsonList);

  Future<List<Map<String, dynamic>>> exportAllToJson();
}
