// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tuyap/core/network/models/base_response.dart';

class SampleResponseModel extends BaseResponse<SampleResponseModel> {
  dynamic data;
  bool? status;
  String? errorMessage;
  SampleResponseModel({
    this.data,
    this.status,
    this.errorMessage,
  });

  @override
  SampleResponseModel fromJson(Map<String, dynamic> json) {
    return SampleResponseModel.fromMap(json);
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

  factory SampleResponseModel.fromMap(Map<String, dynamic> map) {
    return SampleResponseModel(
      data: map['data'] as dynamic,
      status: map['status'] != null ? map['status'] as bool : null,
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SampleResponseModel.fromJson(String source) =>
      SampleResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
