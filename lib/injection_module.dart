import 'package:injectable/injectable.dart';
import 'package:tuyap/core/network/network_manager.dart';
import 'package:tuyap/domain/network/model/sample_response_model.dart';

import 'core/network/configuration/network_configuration.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  NetworkManager<SampleResponseModel> get manager =>
      NetworkManager<SampleResponseModel>()
        ..initialize(
          NetworkConfiguration('https://prevapi.bighawk.xyz'),
          responseModel: SampleResponseModel(),
          entityKey: 'data',
        );
}
