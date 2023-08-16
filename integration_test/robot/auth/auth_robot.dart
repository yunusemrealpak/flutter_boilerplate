import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../i_robot.dart';
import 'scenarios/login/auth_login_scenario.dart';
import 'scenarios/register/auth_register_scenario.dart';

@immutable
final class AuthRobot implements IRobot<AuthRobot> {
  final WidgetTester tester;
  const AuthRobot(this.tester);

  @override
  List<Type> get scenarios => [AuthLoginScenario, AuthRegisterScenario];

  @override
  Future<void> runScenario(Type scenario) async {
    final scenarioType = scenarios.firstWhere((s) => s == scenario);

    switch (scenarioType) {
      
      case AuthLoginScenario:
        await AuthLoginScenario(tester).run();
        break;
      case AuthRegisterScenario:
        await AuthRegisterScenario(tester).run();
        break;
    }
  }
}
