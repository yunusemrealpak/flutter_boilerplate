import 'configuration/network_configuration.dart';
import 'models/base_response.dart';

mixin INetworkManager<T extends BaseResponse<T>> {
  void initialize(
    NetworkConfiguration configuration, {
    required T responseModel,
    String? entityKey,
  });
}