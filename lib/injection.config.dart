// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_boilerplate/application/sample/sample_cubit.dart'
    as _i7;
import 'package:flutter_boilerplate/core/network/network_manager.dart' as _i3;
import 'package:flutter_boilerplate/domain/network/model/sample_response_model.dart'
    as _i4;
import 'package:flutter_boilerplate/domain/sample/i_sample_repository.dart'
    as _i5;
import 'package:flutter_boilerplate/infrastructure/sample_repository.dart'
    as _i6;
import 'package:flutter_boilerplate/injection_module.dart' as _i8;
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
    gh.lazySingleton<_i3.NetworkManager<_i4.SampleResponseModel>>(
        () => injectionModule.manager);
    gh.lazySingleton<_i5.ISampleRepository>(() => _i6.SampleRepository(
        gh<_i3.NetworkManager<_i4.SampleResponseModel>>()));
    gh.factory<_i7.SampleCubit>(
        () => _i7.SampleCubit(gh<_i5.ISampleRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i8.InjectionModule {}
