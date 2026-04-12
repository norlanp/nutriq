import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/repository/fasting_repository.dart';

class GetFastingHistoryUsecase {
  final FastingRepository _fastingRepository;

  GetFastingHistoryUsecase(this._fastingRepository);

  Future<List<FastingEntity>> getHistory(
          DateTime startDate, DateTime endDate) =>
      _fastingRepository.getFastingHistory(startDate, endDate);
}
