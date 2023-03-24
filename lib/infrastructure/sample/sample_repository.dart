import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_boilerplate/core/utility/helper_functions.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/http_types.dart';
import '../../domain/network/model/sample_response_model.dart';
import '../../domain/network/network_paths.dart';
import '../../domain/sample/i_sample_repository.dart';
import '../../domain/sample/model/sample_post_model.dart';

@LazySingleton(as: ISampleRepository)
class SampleRepository extends ISampleRepository {
  SampleRepository(super.manager);

  @override
  Future<SamplePostModel?> getSamplePost() async {
    //await manager.cleanCache();
    final response = await coreDio.send<SamplePostModel, SamplePostModel>(
      '${NetworkPaths.getSamplePost}/1',
      parserModel: const SamplePostModel(),
      type: HttpTypes.get,
      cachePolicy: CachePolicy.forceCache,
      maxStale: const Duration(seconds: 10),
    ) as SampleResponseModel;

    switch (response.statusCode) {
      case 1:
        return response.data as SamplePostModel;
      default:
        return null;
    }
  }
}
