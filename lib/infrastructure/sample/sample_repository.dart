import 'package:busenet/busenet.dart';
import 'package:injectable/injectable.dart';

import '../../domain/network/network_paths.dart';
import '../../domain/sample/i_sample_repository.dart';
import '../../domain/sample/model/sample_post_model.dart';

@LazySingleton(as: ISampleRepository)
class SampleRepository extends ISampleRepository {
  SampleRepository(super.manager);

  @override
  Future<SamplePostModel?> getSamplePost() async {
    //await manager.cleanCache();
    final response = await manager.fetch<SamplePostModel, SamplePostModel>(
      '${NetworkPaths.getSamplePost}/1',
      parserModel: const SamplePostModel(),
      type: HttpTypes.get,
      maxStale: const Duration(seconds: 10),
    );

    switch (response.statusCode) {
      case 1:
        return response.data as SamplePostModel;
      default:
        return null;
    }
  }
}
