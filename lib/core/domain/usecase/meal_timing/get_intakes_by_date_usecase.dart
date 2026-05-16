import 'package:nutriq/core/domain/repository/intake_repository.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';

class GetIntakesByDateUsecase {
  final IntakeRepository _intakeRepository;

  GetIntakesByDateUsecase(this._intakeRepository);

  Future<List<IntakeEntity>> call(DateTime date) async {
    return await _intakeRepository.getIntakesByDate(date);
  }
}
