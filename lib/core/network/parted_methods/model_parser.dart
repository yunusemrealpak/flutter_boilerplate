part of '../dio/core_dio.dart';

R? _parseBody<T extends BaseEntity, R>(
  dynamic responseBody, {
  required T model,
  String? entityKey,
}) {
  dynamic data = responseBody;

  if (entityKey != null) {
    data = responseBody[entityKey];
  }

  if (data == null) {
    customPrint(
        fromWhere: 'Network Layer',
        type: '_parseBody',
        data: 'Be careful your data $data, Cannot be null');
    return null;
  }

  try {
    if (data is List) {
      return data.map((data) => model.fromJson(data)).cast<T>().toList() as R;
    } else if (data is Map<String, dynamic>) {
      return model.fromJson(data) as R;
    } else {
      if (R is NoResultResponse || R == NoResultResponse) {
        return NoResultResponse() as R;
      } else {
        customPrint(
            fromWhere: 'Network Layer',
            type: '_parseBody',
            data: 'Be careful your data $data, I could not parse it');
        return null;
      }
    }
  } catch (e) {
    customPrint(
        fromWhere: 'Network Layer',
        type: '_parseBody',
        data:
            'Parse Error: $e - response body: $data T model: $T , R model: $R ');
  }
  return null;
}
