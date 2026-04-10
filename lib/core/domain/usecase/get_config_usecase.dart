import 'package:nutriq/core/data/repository/config_repository.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';

class GetConfigUsecase {
  final ConfigRepository _configRepository;

  GetConfigUsecase(this._configRepository);

  Future<ConfigEntity> getConfig() async {
    return await _configRepository.getConfig();
  }
}
