import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/localization/localization_manager.dart';
import 'core/storage/shared_preferences/shared_preferences_helper.dart';
import 'injection.dart';
import 'presentation/sample/sample_language_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await dotenv.load();
  await SharedPreferencesHelper.init();
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager().supportedLocales,
      useOnlyLangCode: true,
      path: 'assets/i10n',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SampleLanguageView(),
    );
  }
}
