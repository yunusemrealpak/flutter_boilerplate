import 'package:busbus/busbus.dart';
import 'package:dartz/dartz.dart';

import 'model/failure.dart';
import 'model/sample_response_model.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;

abstract class BaseRepository {
  late INetworkManager<SampleResponseModel> manager;
  BaseRepository(this.manager);

  ICoreDio get coreDio => manager.coreDio;
}
