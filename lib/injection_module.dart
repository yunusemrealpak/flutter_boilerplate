import 'package:busbus/busbus.dart';
import 'package:flutter_boilerplate/app_config.dart';
import 'package:flutter_boilerplate/core/enums/enviroment_types.dart';
import 'package:injectable/injectable.dart';
import 'domain/network/model/sample_response_model.dart';

@module
abstract class InjectionModule {
  @singleton
  NetworkManager<SampleResponseModel> get manager =>
      NetworkManager<SampleResponseModel>()
        ..initialize(
          NetworkConfiguration(
            AppConfig.isDebug
                ? EnvTypes.devApiUrl.getValue
                : EnvTypes.apiUrl.getValue,
          ),
          responseModel: SampleResponseModel(),
          cacheStoreKey: 'boilerplate_cache',
        );
}
