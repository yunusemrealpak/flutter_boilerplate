// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/_common/style/theme/theme_manager.dart';
import 'package:flutter_boilerplate/_core/init/application_init.dart';
import 'package:flutter_boilerplate/_core/localization/localization_manager.dart';
import 'package:flutter_boilerplate/injection/get_it_container.dart';
import 'package:flutter_boilerplate/main/config/app_flavor_config.dart';
import 'package:flutter_boilerplate/main/main_common.dart';
import 'package:flutter_test/flutter_test.dart';

@immutable
final class TestHelper<T> {
  final WidgetTester tester;

  const TestHelper(this.tester);

  Finder findText(String text, {Matcher? matcher}) {
    final item = find.text(text);
    expect(
      item,
      matcher ?? findsOneWidget,
      reason: 'Error: $T/findText - $text',
    );
    return item;
  }

  Finder findItem(Key key, {Matcher? matcher}) {
    final item = find.byKey(key);
    expect(
      item,
      matcher ?? findsOneWidget,
      reason: 'Error: $T/findItem - $key',
    );
    return item;
  }

  Future<void> findAndTapItem(Key key) async {
    final item = findItem(key);
    await tester.tap(item, warnIfMissed: false);
  }

  Future<void> findAndEnterText(Key key, String text) async {
    final item = findItem(key);
    await tester.enterText(item, text);
  }

  void print(String text, {bool newLine = false, bool showDoneEmoji = true}) {
    final line = newLine ? '\n' : '';
    final doneEmoji = showDoneEmoji ? '✅' : '';
    tester.printToConsole('$line → $text $doneEmoji');
  }
}

extension TestHelperExtensions<T> on TestHelper<T> {
  Future<void> appStart() async {
    await GetItContainer.resetDependencies();

    final config = AppFlavorConfig(
      flavor: AppFlavor.dev,
      title: 'Test',
      theme: ThemeManager.themeDev,
    );

    await ApplicationInit.init(config);

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: LocalizationManager.instance.supportedLocales,
        useOnlyLangCode: LocalizationManager.instance.useOnlyLangCode,
        path: LocalizationManager.instance.path,
        child: MyApp(config: config),
      ),
    );

    await tester.pumpAndSettle();
  }
}
