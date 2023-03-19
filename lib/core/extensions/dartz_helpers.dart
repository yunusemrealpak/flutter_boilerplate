import 'package:dartz/dartz.dart';

extension DartzHelpers<L, R> on Either<L, R> {
  R get right => (this as Right).value as R;
  L get left => (this as Left).value as L;
}
