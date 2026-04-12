import 'package:nutriq/core/domain/repository/fasting_repository.dart';

class EndFastingUsecase {
  final FastingRepository _fastingRepository;

  EndFastingUsecase(this._fastingRepository);

  Future<void> endFast(int id, DateTime endTime) =>
      _fastingRepository.endFast(id, endTime);
}
