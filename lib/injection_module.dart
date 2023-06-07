import 'package:busenet/busenet.dart';
import 'package:injectable/injectable.dart';

import 'domain/network/model/response_model.dart';

@module
abstract class InjectionModule {
  @singleton
  INetworkManager<ResponseModel> get manager => NetworkManager<ResponseModel>();
}
