import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

class AddWeightUsecase {
  final WeightRepository _weightRepository;

  AddWeightUsecase(this._weightRepository);

  Future<void> addWeight(WeightEntity entity) async {
    return await _weightRepository.addWeight(entity);
  }
}
