import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/domain/network/app_network_manager.dart';

import 'model/failure.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;

abstract class BaseRepository {
  late AppNetworkManager manager;
  BaseRepository(this.manager);
}
