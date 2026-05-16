import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

class DeleteWeightUsecase {
  final WeightRepository _weightRepository;

  DeleteWeightUsecase(this._weightRepository);

  Future<void> deleteWeight(WeightEntity entity) async {
    await _weightRepository.deleteWeight(entity);
  }
}
