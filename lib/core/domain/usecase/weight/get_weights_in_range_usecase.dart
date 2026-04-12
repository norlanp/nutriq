import 'package:nutriq/core/data/repository/weight_repository.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

class GetWeightsInRangeUsecase {
  final WeightRepository _weightRepository;

  GetWeightsInRangeUsecase(this._weightRepository);

  Future<List<WeightEntity>> getWeightsInRange(
      DateTime start, DateTime end) async {
    return await _weightRepository.getWeightsBetweenDates(start, end);
  }
}
