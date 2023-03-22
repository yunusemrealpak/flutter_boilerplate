import '../../common/enums/dynamic_link_type.dart';
import '../network/base_repository.dart';

abstract class IDeeplinkRepository extends BaseRepository {
  IDeeplinkRepository(super.manager);

  Future<String?> createDeeplink(DynamicLinkType type, {dynamic data});
}
