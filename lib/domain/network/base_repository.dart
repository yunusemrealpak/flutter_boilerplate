import 'package:busenet/busenet.dart';
import 'package:dartz/dartz.dart';

import 'model/failure.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;

abstract class BaseRepository {
  late INetworkManager<EmptyResponseModel> manager;
  BaseRepository(this.manager);
  
}
