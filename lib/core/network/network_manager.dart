import 'package:dio/dio.dart';

import 'configuration/network_configuration.dart';
import 'dio/core_dio.dart';
import 'dio/i_core_dio.dart';
import 'i_netwok_manager.dart';
import 'models/base_response.dart';

class NetworkManager<T extends BaseResponse<T>> implements INetworkManager<T> {
  late ICoreDio<T> coreDio;

  @override
  void initialize(
    NetworkConfiguration configuration, {
    required T responseModel,
    String? entityKey,
  }) {
    final baseOptions = BaseOptions(
      baseUrl: configuration.baseUrl,
      connectTimeout: configuration.connectTimeout,
      receiveTimeout: configuration.receiveTimeout,
      sendTimeout: configuration.sendTimeout,
      validateStatus: (status) {
        if (status == null) return false;
        return status < configuration.minimumValidateStatus;
      },
    );

    if (configuration.apiKey != null) {
      baseOptions.headers['apiKey'] = configuration.apiKey;
    }

    coreDio = CoreDio<T>(baseOptions, responseModel, entityKey);
  }

  void addHeader(Map<String, dynamic> value) {
    coreDio.addHeader(value);
  }

  void addAuthorizationHeader(String token) {
    coreDio.removeAuthorizationHeader();
    coreDio.addAuthorizationHeader(token);
  }

  void removeHeader(String key) {
    coreDio.removeHeader(key);
  }

  void removeAuthorizationHeader() {
    coreDio.removeAuthorizationHeader();
  }
}
