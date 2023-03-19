// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tuyap/core/network/models/base_entity.dart';
import 'package:tuyap/core/network/models/base_response.dart';

class AppLogistResponseModel extends BaseResponse<AppLogistResponseModel> {
  dynamic entity;
  dynamic error;
  bool? success;
  String? message;

  AppLogistResponseModel({
    this.entity,
    this.error,
    this.success,
    this.message,
  });

  @override
  void setData<R>(R entity) {
    this.entity = entity;
  }

  @override
  AppLogistResponseModel fromJson(Map<String, dynamic> json) {
    return AppLogistResponseModel.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entity': entity,
      'error': error,
      'success': success,
      'message': message,
    };
  }

  factory AppLogistResponseModel.fromMap(Map<String, dynamic> map) {
    return AppLogistResponseModel(
      entity: map['entity'] as dynamic,
      error: map['error'] as dynamic,
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppLogistResponseModel.fromJson(String source) =>
      AppLogistResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
