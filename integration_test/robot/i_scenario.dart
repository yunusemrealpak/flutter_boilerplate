import '../utility/test_helper.dart';

abstract interface class IScenario<T> {
  TestHelper<T> get helper;

  Future<void> run();
}
