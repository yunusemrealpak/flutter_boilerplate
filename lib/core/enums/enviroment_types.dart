import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypes {
  apiUrl('API_URL'),
  devApiUrl('DEV_API_URL');

  const EnvTypes(this.value);
  final String value;

  String get getValue => dotenv.get(value);
}
