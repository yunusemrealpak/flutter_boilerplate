import 'package:flutter_boilerplate/_application/core/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deeplink_state.freezed.dart';

@freezed
class DeeplinkState extends BaseState with _$DeeplinkState {
  const factory DeeplinkState({
    String? referanceCode,
  }) = _DeeplinkState;
  factory DeeplinkState.initial() => const DeeplinkState();
}
