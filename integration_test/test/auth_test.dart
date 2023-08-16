import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robot/auth/auth_robot.dart';
import '../utility/test_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth Test Group', () {
    
    testWidgets(
      'AuthLogin Test',
      (WidgetTester tester) async {
        await TestHelper<void>(tester).appStart();
        await tester.pumpAndSettle(const Duration(seconds: 1));

        final robot = AuthRobot(tester);

        // TODO: Add test code here
      },
    );

    testWidgets(
      'AuthRegister Test',
      (WidgetTester tester) async {
        await TestHelper<void>(tester).appStart();
        await tester.pumpAndSettle(const Duration(seconds: 1));

        final robot = AuthRobot(tester);

        // TODO: Add test code here
      },
    );
  });
}
        