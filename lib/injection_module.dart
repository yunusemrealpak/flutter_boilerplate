import 'package:busenet/busenet.dart';
import 'package:flutter_boilerplate/app_config.dart';
import 'package:flutter_boilerplate/core/enums/enviroment_types.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @singleton
  INetworkManager<EmptyResponseModel> get manager =>
      NetworkManager<EmptyResponseModel>()
        ..initialize(
          NetworkConfiguration(
            AppConfig.isDebug
                ? EnvTypes.devApiUrl.getValue
                : EnvTypes.apiUrl.getValue,
          ),
          responseModel: EmptyResponseModel(),
          cacheStoreKey: 'boilerplate_cache',
        );
}
