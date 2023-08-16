// ignore_for_file: one_member_abstracts

import 'package:flutter_test/flutter_test.dart';

abstract interface class IRobot<T> {
  List<Type> get scenarios;
  Future<void> runScenario(Type scenario);
}
