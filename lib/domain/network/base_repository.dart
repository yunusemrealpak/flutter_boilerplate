import 'package:dartz/dartz.dart';
import 'package:tuyap/core/network/network_manager.dart';
import 'package:tuyap/domain/network/model/sample_response_model.dart';
import '../../core/network/dio/i_core_dio.dart';
import 'model/failure.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;

abstract class BaseRepository {
  late NetworkManager<SampleResponseModel> manager;
  BaseRepository(this.manager);

  ICoreDio get coreDio => manager.coreDio;
}
