import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuyap/application/core/base_state.dart';

part 'sample_state.freezed.dart';

@freezed
class SampleState extends BaseState with _$SampleState {
  const factory SampleState({
    @Default(false) bool isLoading,
    @Default('') String token,
  }) = _SampleState;
  factory SampleState.initial() => const SampleState();
}
