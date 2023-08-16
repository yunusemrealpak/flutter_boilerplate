import 'package:flutter_test/flutter_test.dart';

import '../../../../utility/test_helper.dart';
import 'i_auth_register_scenario.dart';

final class AuthRegisterScenario implements IAuthRegisterScenario<AuthRegisterScenario> {
  final WidgetTester tester;
  const AuthRegisterScenario(this.tester);

  @override
  TestHelper<AuthRegisterScenario> get helper => TestHelper<AuthRegisterScenario>(tester);

  @override
  Future<void> run() async {}
}
