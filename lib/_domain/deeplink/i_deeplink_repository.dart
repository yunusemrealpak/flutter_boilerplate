import '../../_common/enums/dynamic_link_type.dart';

abstract interface class IDeeplinkRepository {
  Future<String?> createDeeplink(DynamicLinkType type, {dynamic data});
}
