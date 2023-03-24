import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../enums/http_types.dart';
import '../models/base_entity.dart';
import '../models/base_response.dart';

abstract class ICoreDio<T extends BaseResponse<T>> {
  void addHeader(Map<String, dynamic> value);
  void addAuthorizationHeader(String token);
  void removeHeader(String key);
  void removeAuthorizationHeader();

  void addInterceptor(Interceptor interceptor);

  Future<T> send<E extends BaseEntity<E>, R>(
    String path, {
    required E parserModel,
    required HttpTypes type,
    String contentType = Headers.jsonContentType,
    ResponseType responseType = ResponseType.json,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,

    /// Cache Options
    CachePolicy? cachePolicy,
    Duration? maxStale,
  });
}
