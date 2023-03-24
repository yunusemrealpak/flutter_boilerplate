// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:busbus/busbus.dart' as _i9;
import 'package:flutter_boilerplate/application/app/app_cubit.dart' as _i3;
import 'package:flutter_boilerplate/application/auth/auth_cubit.dart' as _i20;
import 'package:flutter_boilerplate/application/sample/sample_cubit.dart'
    as _i13;
import 'package:flutter_boilerplate/application/services/deeplink/deeplink_cubit.dart'
    as _i21;
import 'package:flutter_boilerplate/application/session/session_cubit.dart'
    as _i14;
import 'package:flutter_boilerplate/application/splash/splash_cubit.dart'
    as _i15;
import 'package:flutter_boilerplate/core/storage/hive/i_cache_service.dart'
    as _i4;
import 'package:flutter_boilerplate/domain/auth/i_auth_repository.dart' as _i16;
import 'package:flutter_boilerplate/domain/cache/model/config.dart' as _i5;
import 'package:flutter_boilerplate/domain/cache/model/token_model.dart' as _i7;
import 'package:flutter_boilerplate/domain/deeplink/i_deeplink_repository.dart'
    as _i18;
import 'package:flutter_boilerplate/domain/network/model/sample_response_model.dart'
    as _i10;
import 'package:flutter_boilerplate/domain/sample/i_sample_repository.dart'
    as _i11;
import 'package:flutter_boilerplate/infrastructure/auth/auth_repository.dart'
    as _i17;
import 'package:flutter_boilerplate/infrastructure/cache/config_cache_service.dart'
    as _i6;
import 'package:flutter_boilerplate/infrastructure/cache/token_cache_service.dart'
    as _i8;
import 'package:flutter_boilerplate/infrastructure/deeplink/deeplink_repository.dart'
    as _i19;
import 'package:flutter_boilerplate/infrastructure/sample/sample_repository.dart'
    as _i12;
import 'package:flutter_boilerplate/injection_module.dart' as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.AppCubit>(() => _i3.AppCubit());
    gh.lazySingleton<_i4.ICacheManager<_i5.Config>>(
      () => _i6.ConfigCacheService(),
      instanceName: 'config_service',
    );
    gh.lazySingleton<_i4.ICacheManager<_i7.TokenModel>>(
      () => _i8.TokenCacheService(),
      instanceName: 'token_service',
    );
    gh.singleton<_i9.INetworkManager<_i10.SampleResponseModel>>(
        injectionModule.manager);
    gh.lazySingleton<_i11.ISampleRepository>(() => _i12.SampleRepository(
        gh<_i9.INetworkManager<_i10.SampleResponseModel>>()));
    gh.factory<_i13.SampleCubit>(
        () => _i13.SampleCubit(gh<_i11.ISampleRepository>()));
    gh.factory<_i14.SessionCubit>(() => _i14.SessionCubit());
    gh.factory<_i15.SplashCubit>(() => _i15.SplashCubit());
    gh.lazySingleton<_i16.IAuthRepository>(() => _i17.AuthRepository(
          gh<_i9.INetworkManager<_i10.SampleResponseModel>>(),
          gh<_i4.ICacheManager<_i7.TokenModel>>(instanceName: 'config_service'),
        ));
    gh.lazySingleton<_i18.IDeeplinkRepository>(() => _i19.DeeplinkRepository(
        gh<_i9.INetworkManager<_i10.SampleResponseModel>>()));
    gh.factory<_i20.AuthCubit>(
        () => _i20.AuthCubit(gh<_i16.IAuthRepository>()));
    gh.lazySingleton<_i21.DeeplinkCubit>(() => _i21.DeeplinkCubit(
          gh<_i4.ICacheManager<_i5.Config>>(instanceName: 'config_service'),
          gh<_i18.IDeeplinkRepository>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i22.InjectionModule {}
