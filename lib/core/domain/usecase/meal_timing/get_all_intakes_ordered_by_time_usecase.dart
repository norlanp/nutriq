import 'package:nutriq/core/data/repository/intake_repository.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';

class GetAllIntakesOrderedByTimeUsecase {
  final IntakeRepository _intakeRepository;

  GetAllIntakesOrderedByTimeUsecase(this._intakeRepository);

  Future<List<IntakeEntity>> call() async {
    return await _intakeRepository.getAllIntakesOrderedByTime();
  }
}
