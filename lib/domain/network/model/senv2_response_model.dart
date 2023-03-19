// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tuyap/core/network/models/base_response.dart';

class SenV2ResponseModel extends BaseResponse<SenV2ResponseModel> {
  dynamic data;
  bool? status;
  String? errorMessage;
  SenV2ResponseModel({
    this.data,
    this.status,
    this.errorMessage,
  });

  @override
  SenV2ResponseModel fromJson(Map<String, dynamic> json) {
    return SenV2ResponseModel.fromMap(json);
  }

  @override
  void setData<R>(R entity) {
    data = entity;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'status': status,
      'errorMessage': errorMessage,
    };
  }

  factory SenV2ResponseModel.fromMap(Map<String, dynamic> map) {
    return SenV2ResponseModel(
      data: map['data'] as dynamic,
      status: map['status'] != null ? map['status'] as bool : null,
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SenV2ResponseModel.fromJson(String source) =>
      SenV2ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
