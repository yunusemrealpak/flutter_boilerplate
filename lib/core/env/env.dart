import 'package:envied/envied.dart';

import '../../app_flavor_config.dart';
import '../enums/flavor_types.dart';

part 'env.g.dart';

class AppEnv {
  static AppFlavorConfig config = AppFlavorConfig.initial();

  static bool get isDev => config.flavor == 'dev';
  static bool get isProd => config.flavor == 'prod';

  static void setConfig(AppFlavorConfig appConfig) {
    config = appConfig;
  }

  static String get apiUrl {
    final flavor = FlavorTypes.fromValue(config.flavor);
    switch (flavor) {
      case FlavorTypes.dev:
        return _DevEnv.API_URL;
      case FlavorTypes.prod:
      case FlavorTypes.staging:
        return _ProdEnv.API_URL;
    }
  }

  static String get devApiUrl {
    final flavor = FlavorTypes.fromValue(config.flavor);
    switch (flavor) {
      case FlavorTypes.dev:
        return _DevEnv.DEV_API_URL;
      case FlavorTypes.prod:
      case FlavorTypes.staging:
        return _ProdEnv.DEV_API_URL;
    }
  }
}

@Envied(path: '.env.development')
abstract class _DevEnv {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String API_URL = __DevEnv.API_URL;
  @EnviedField(varName: 'DEV_API_URL', obfuscate: true)
  static String DEV_API_URL = __DevEnv.DEV_API_URL;
}

@Envied(path: '.env.production')
abstract class _ProdEnv {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String API_URL = __ProdEnv.API_URL;
  @EnviedField(varName: 'DEV_API_URL', obfuscate: true)
  static String DEV_API_URL = __ProdEnv.DEV_API_URL;
}
