import 'package:nutriq/core/domain/repository/fasting_repository.dart';

class GetCurrentStreakUsecase {
  final FastingRepository _fastingRepository;

  GetCurrentStreakUsecase(this._fastingRepository);

  Future<int> getCurrentStreak() => _fastingRepository.getCurrentStreak();
}
