import '../network/base_repository.dart';
import 'model/application_config.dart';

abstract class ISampleRepository extends BaseRepository {
  ISampleRepository(super.manager);

  Future<ApplicationConfig?> getConfig();
}
