// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_boilerplate/application/sample/sample_cubit.dart'
    as _i14;
import 'package:flutter_boilerplate/application/services/deeplink/deeplink_cubit.dart'
    as _i15;
import 'package:flutter_boilerplate/core/network/network_manager.dart' as _i8;
import 'package:flutter_boilerplate/core/storage/hive/i_cache_service.dart'
    as _i3;
import 'package:flutter_boilerplate/domain/cache/model/config.dart' as _i4;
import 'package:flutter_boilerplate/domain/cache/model/token_model.dart' as _i6;
import 'package:flutter_boilerplate/domain/deeplink/i_deeplink_repository.dart'
    as _i10;
import 'package:flutter_boilerplate/domain/network/model/sample_response_model.dart'
    as _i9;
import 'package:flutter_boilerplate/domain/sample/i_sample_repository.dart'
    as _i12;
import 'package:flutter_boilerplate/infrastructure/cache/config_cache_service.dart'
    as _i5;
import 'package:flutter_boilerplate/infrastructure/cache/token_cache_service.dart'
    as _i7;
import 'package:flutter_boilerplate/infrastructure/deeplink/deeplink_repository.dart'
    as _i11;
import 'package:flutter_boilerplate/infrastructure/sample_repository.dart'
    as _i13;
import 'package:flutter_boilerplate/injection_module.dart' as _i16;
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
    gh.lazySingleton<_i3.ICacheManager<_i4.Config>>(
      () => _i5.ConfigCacheService(),
      instanceName: 'config_service',
    );
    gh.lazySingleton<_i3.ICacheManager<_i6.TokenModel>>(
      () => _i7.TokenCacheService(),
      instanceName: 'token_service',
    );
    gh.lazySingleton<_i8.NetworkManager<_i9.SampleResponseModel>>(
        () => injectionModule.manager);
    gh.lazySingleton<_i10.IDeeplinkRepository>(() => _i11.DeeplinkRepository(
        gh<_i8.NetworkManager<_i9.SampleResponseModel>>()));
    gh.lazySingleton<_i12.ISampleRepository>(() => _i13.SampleRepository(
        gh<_i8.NetworkManager<_i9.SampleResponseModel>>()));
    gh.factory<_i14.SampleCubit>(
        () => _i14.SampleCubit(gh<_i12.ISampleRepository>()));
    gh.lazySingleton<_i15.DeeplinkCubit>(() => _i15.DeeplinkCubit(
          gh<_i3.ICacheManager<_i4.Config>>(instanceName: 'config_service'),
          gh<_i10.IDeeplinkRepository>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i16.InjectionModule {}
