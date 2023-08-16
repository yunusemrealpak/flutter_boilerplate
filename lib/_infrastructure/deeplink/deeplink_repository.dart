import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/_common/enums/dynamic_link_type.dart';
import 'package:flutter_boilerplate/_domain/network/app_network_manager.dart';
import 'package:injectable/injectable.dart';

import '../../_domain/deeplink/i_deeplink_repository.dart';

@LazySingleton(as: IDeeplinkRepository)
@immutable
final class DeeplinkRepository implements IDeeplinkRepository {
  final AppNetworkManager manager;
  const DeeplinkRepository(this.manager);

  @override
  Future<String?> createDeeplink(DynamicLinkType type, {data}) async {
    // TODO: implement createDeeplink
    throw UnimplementedError();
  }
}
