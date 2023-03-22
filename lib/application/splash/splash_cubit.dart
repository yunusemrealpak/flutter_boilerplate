import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/_route/route_paths.dart';
import '../core/base_cubit.dart';
import 'splash_state.dart';

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void init() {
    Future.delayed(const Duration(seconds: 2), () {
      context.router.pushNamed(RoutePaths.APP);
    });
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
