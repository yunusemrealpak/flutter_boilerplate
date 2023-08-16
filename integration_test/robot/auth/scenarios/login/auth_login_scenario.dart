import 'package:flutter_test/flutter_test.dart';

import '../../../../utility/test_helper.dart';
import 'i_auth_login_scenario.dart';

final class AuthLoginScenario implements IAuthLoginScenario<AuthLoginScenario> {
  final WidgetTester tester;
  const AuthLoginScenario(this.tester);

  @override
  TestHelper<AuthLoginScenario> get helper => TestHelper<AuthLoginScenario>(tester);

  @override
  Future<void> run() async {}
}
