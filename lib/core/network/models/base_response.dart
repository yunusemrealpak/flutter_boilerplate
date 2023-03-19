import 'package:tuyap/core/network/models/base_entity.dart';

abstract class BaseResponse<T> {
  int? statusCode;

  T fromJson(Map<String, dynamic> json);
  void setData<R>(R entity);
}
