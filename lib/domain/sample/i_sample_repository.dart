import 'package:tuyap/domain/sample/model/application_config.dart';

import '../network/base_repository.dart';

abstract class ISampleRepository extends BaseRepository {
  ISampleRepository(super.manager);

  Future<ApplicationConfig?> getConfig();
}
