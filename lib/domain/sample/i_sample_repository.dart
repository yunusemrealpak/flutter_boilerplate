import 'package:flutter_boilerplate/domain/sample/model/sample_post_model.dart';

import '../network/base_repository.dart';

abstract class ISampleRepository extends BaseRepository {
  ISampleRepository(super.manager);

  Future<SamplePostModel?> getSamplePost();
}
