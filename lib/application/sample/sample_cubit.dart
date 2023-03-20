import 'package:injectable/injectable.dart';

import '../../domain/sample/i_sample_repository.dart';
import '../core/base_cubit.dart';
import 'sample_state.dart';

@injectable
class SampleCubit extends BaseCubit<SampleState> {
  final ISampleRepository _sampleRepository;
  SampleCubit(this._sampleRepository) : super(SampleState.initial());

  Future<void> getSample() async {
    setLoading(true);
    final result = await _sampleRepository.getConfig();
    setLoading(false);
    emit(state.copyWith(token: result?.mapStyle ?? ''));
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
