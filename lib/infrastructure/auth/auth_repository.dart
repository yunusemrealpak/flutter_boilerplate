import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/common/constants/hive_constants.dart';
import 'package:flutter_boilerplate/core/storage/hive/i_cache_service.dart';
import 'package:flutter_boilerplate/domain/cache/model/token_model.dart';
import 'package:flutter_boilerplate/domain/network/base_repository.dart';
import 'package:flutter_boilerplate/domain/auth/model/user.dart';
import 'package:flutter_boilerplate/domain/network/model/sample_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/http_types.dart';
import '../../domain/auth/i_auth_repository.dart';
import '../../domain/network/model/failure.dart';
import '../../domain/network/network_paths.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  final ICacheManager<TokenModel> _cacheManager;
  AuthRepository(
    super.manager,
    @Named(HiveConstants.configServiceKey) this._cacheManager,
  );

  @override
  EitherFuture<User> login(String email, String password) async {
    final response = await coreDio.send<User, User>(
      NetworkPaths.login,
      parserModel: const User(),
      type: HttpTypes.post,
    ) as SampleResponseModel;

    switch (response.statusCode) {
      case 1:
        final status = response.status ?? false;
        if (!status) return left(Failure(message: response.errorMessage));

        final user = response.data as User;

        final tokenModel = _cacheManager.getData();
        await _cacheManager.setData(
          tokenModel?.copyWith(accessToken: user.token) ??
              TokenModel(accessToken: user.token),
        );

        return right(user);
      default:
        return left(Failure(message: response.errorMessage));
    }
  }
}
