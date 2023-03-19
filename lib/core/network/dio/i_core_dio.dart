import 'package:dio/dio.dart';
import 'package:tuyap/core/network/models/base_entity.dart';

import '../../enums/http_types.dart';
import '../models/base_response.dart';

abstract class ICoreDio<T extends BaseResponse> {
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
  });
}
