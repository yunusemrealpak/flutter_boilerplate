import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_flavor_config.dart';
import 'application/app/app_cubit.dart';
import 'application/services/deeplink/deeplink_cubit.dart';
import 'application/session/session_cubit.dart';
import 'injection.dart';
import 'presentation/_route/router.dart';

Widget mainCommon(AppFlavorConfig flavorConfig) {
  return MyApp(config: flavorConfig);
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  final AppFlavorConfig config;
  const MyApp({
    required this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<DeeplinkCubit>(), lazy: false),
        BlocProvider(create: (context) => di<SessionCubit>(), lazy: false),
        BlocProvider(create: (context) => di<AppCubit>(), lazy: false),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: config.debugShowCheckedModeBanner,
        title: config.title,
        theme: config.theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
