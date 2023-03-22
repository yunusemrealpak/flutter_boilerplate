import 'package:injectable/injectable.dart';

import '../core/base_cubit.dart';
import 'session_state.dart';

@injectable
class SessionCubit extends BaseCubit<SessionState> {
  SessionCubit() : super(SessionState.initial());

  void init() {}

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
