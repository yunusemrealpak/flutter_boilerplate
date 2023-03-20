import 'package:injectable/injectable.dart';

import '../core/enums/http_types.dart';
import '../domain/network/model/sample_response_model.dart';
import '../domain/network/network_paths.dart';
import '../domain/sample/i_sample_repository.dart';
import '../domain/sample/model/application_config.dart';

@LazySingleton(as: ISampleRepository)
class SampleRepository extends ISampleRepository {
  SampleRepository(super.manager);

  @override
  Future<ApplicationConfig?> getConfig() async {
    final response = await coreDio.send<ApplicationConfig, ApplicationConfig>(
      NetworkPaths.getConfig,
      parserModel: const ApplicationConfig(),
      type: HttpTypes.get,
    ) as SampleResponseModel;

    switch (response.statusCode) {
      case 1:
        return response.data as ApplicationConfig;
      default:
        return null;
    }
  }
}
