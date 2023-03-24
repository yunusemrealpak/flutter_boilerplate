import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/sample/model/sample_post_model.dart';
import '../core/base_state.dart';

part 'sample_state.freezed.dart';

@freezed
class SampleState extends BaseState with _$SampleState {
  const factory SampleState({
    @Default(false) bool isLoading,
    SamplePostModel? post,
  }) = _SampleState;
  factory SampleState.initial() => const SampleState();
}
