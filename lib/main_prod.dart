import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_flavor_config.dart';
import 'core/localization/locale_keys.g.dart';
import 'core/localization/localization_manager.dart';
import 'core/storage/shared_preferences/shared_preferences_helper.dart';
import 'injection.dart';
import 'main_common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await dotenv.load();
  await SharedPreferencesHelper.init();
  configureDependencies();

  await Firebase.initializeApp();

  final app = mainCommon(
    AppFlavorConfig(
      flavor: 'prod',
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.appTitleProd.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager().supportedLocales,
      useOnlyLangCode: true,
      path: 'assets/i10n',
      child: app,
    ),
  );
}
