import 'package:dartz/dartz.dart';

import '../../core/network/dio/i_core_dio.dart';
import '../../core/network/network_manager.dart';
import 'model/failure.dart';
import 'model/sample_response_model.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;

abstract class BaseRepository {
  late NetworkManager<SampleResponseModel> manager;
  BaseRepository(this.manager);

  ICoreDio get coreDio => manager.coreDio;
}