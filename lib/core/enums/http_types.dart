enum HttpTypes {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE'),
  patch('PATCH');

  const HttpTypes(this.value);
  final String value;

  static HttpTypes fromValue(String value) {
    return HttpTypes.values.firstWhere((el) => el.value == value);
  }
}
