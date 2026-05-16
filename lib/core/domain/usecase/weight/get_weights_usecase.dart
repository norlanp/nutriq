import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

class GetWeightsUsecase {
  final WeightRepository _weightRepository;

  GetWeightsUsecase(this._weightRepository);

  Future<List<WeightEntity>> getWeights() async {
    return await _weightRepository.getWeights();
  }
}
