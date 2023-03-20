import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../enums/http_types.dart';
import '../../utility/helper_functions.dart';
import '../models/base_entity.dart';
import '../models/base_response.dart';
import '../models/no_result_response.dart';
import 'i_core_dio.dart';

part '../parted_methods/model_parser.dart';

class CoreDio<T extends BaseResponse<T>>
    with DioMixin
    implements Dio, ICoreDio<T> {
  late T responseModel;
  String? entityKey;

  CoreDio(BaseOptions options, this.responseModel, this.entityKey) {
    this.options = options;
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
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
  }) async {
    try {
      final response = await request<dynamic>(
        path,
        data: data,
        options: Options(
          method: type.value,
          contentType: contentType,
          responseType: responseType,
        ),
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          responseModel =
              responseModel.fromJson(response.data as Map<String, dynamic>);

          final entity = _parseBody<E, R>(
            response.data,
            model: parserModel,
            entityKey: entityKey,
          );

          responseModel.setData(entity);
          responseModel.statusCode = 1;

          return responseModel;
        // case 401:
        //   final model = ResponseModel.fromJson(response.data);
        // // await di<DialogService>()
        // //     .showDialog(message: model.errorMessage ?? '');
        // // return ResponseModel(statusCode: -1, data: {'message': ''});
        default:
          responseModel =
              responseModel.fromJson(response.data as Map<String, dynamic>);
          responseModel.statusCode = response.statusCode;
          return responseModel;
      }
    } catch (e) {
      responseModel.statusCode = -1;
      return responseModel;
    }
  }

  @override
  void addHeader(Map<String, dynamic> value) {
    options.headers.addAll(value);
  }

  @override
  void removeHeader(String key) {
    options.headers.remove(key);
  }

  @override
  void addAuthorizationHeader(String token) {
    options.headers.addAll({'Authorization: Bearer ': token});
  }

  @override
  void removeAuthorizationHeader() {
    options.headers.remove('Authorization');
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
  }
}
