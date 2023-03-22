import '../network/base_repository.dart';
import 'model/user.dart';

abstract class IAuthRepository extends BaseRepository {
  IAuthRepository(super.manager);

  EitherFuture<User> login(String email, String password);
}
