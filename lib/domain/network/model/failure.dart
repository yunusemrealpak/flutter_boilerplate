import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({
    String? message,
  }) = _Failure;
  const Failure._();

  factory Failure.serverError() =>
      const Failure(message: "Beklenmedik bir hata oluştu");
}
