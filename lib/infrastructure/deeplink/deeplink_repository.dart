import 'package:flutter_boilerplate/common/enums/dynamic_link_type.dart';
import 'package:injectable/injectable.dart';

import '../../domain/deeplink/i_deeplink_repository.dart';

@LazySingleton(as: IDeeplinkRepository)
class DeeplinkRepository extends IDeeplinkRepository {
  DeeplinkRepository(super.manager);

  @override
  Future<String?> createDeeplink(DynamicLinkType type, {data}) async {
    // TODO: implement createDeeplink
    throw UnimplementedError();
  }
}
