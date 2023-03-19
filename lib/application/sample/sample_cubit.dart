import 'package:injectable/injectable.dart';
import 'package:tuyap/application/sample/sample_state.dart';
import 'package:tuyap/domain/sample/i_sample_repository.dart';

import '../core/base_cubit.dart';

@injectable
class SampleCubit extends BaseCubit<SampleState> {
  final ISampleRepository _sampleRepository;
  SampleCubit(this._sampleRepository) : super(SampleState.initial());

  getSample() async {
    setLoading(true);
    var result = await _sampleRepository.getConfig();
    setLoading(false);
    emit(state.copyWith(token: result?.mapStyle ?? ''));
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
