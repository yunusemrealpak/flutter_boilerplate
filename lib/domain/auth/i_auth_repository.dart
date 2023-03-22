import 'package:flutter_boilerplate/domain/auth/model/user.dart';

import '../network/base_repository.dart';

abstract class IAuthRepository extends BaseRepository {
  IAuthRepository(super.manager);

  EitherFuture<User> login(String email, String password);
}
