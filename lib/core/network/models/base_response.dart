abstract class BaseResponse<T> {
  int? statusCode;

  T fromJson(Map<String, dynamic> json);
  void setData<R>(R entity);
}
