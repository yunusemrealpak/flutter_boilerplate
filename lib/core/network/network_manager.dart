import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

import 'configuration/network_configuration.dart';
import 'dio/core_dio.dart';
import 'dio/i_core_dio.dart';
import 'i_netwok_manager.dart';
import 'models/base_response.dart';

class NetworkManager<T extends BaseResponse<T>> implements INetworkManager<T> {
  late ICoreDio<T> coreDio;
  late HiveCacheStore cacheStore;

  @override
  Future<void> initialize(
    NetworkConfiguration configuration, {
    required T responseModel,
    String? entityKey,
    String? cacheStoreKey,
  }) async {
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

    final cacheDir = await getTemporaryDirectory();
    cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: cacheStoreKey ?? 'network_cache',
    );

    final cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.noCache,
      priority: CachePriority.high,
      maxStale: const Duration(minutes: 1),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
    );

    coreDio = CoreDio<T>(baseOptions, cacheOptions, responseModel, entityKey)
      ..addInterceptor(DioCacheInterceptor(options: cacheOptions));
  }

  @override
  void addHeader(Map<String, dynamic> value) {
    coreDio.addHeader(value);
  }

  @override
  void addAuthorizationHeader(String token) {
    coreDio.removeAuthorizationHeader();
    coreDio.addAuthorizationHeader(token);
  }

  @override
  void removeHeader(String key) {
    coreDio.removeHeader(key);
  }

  @override
  void removeAuthorizationHeader() {
    coreDio.removeAuthorizationHeader();
  }

  @override
  Future<void> cleanCache() async {
    await cacheStore.clean();
  }
}
