import 'package:busbus/busbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_post_model.freezed.dart';
part 'sample_post_model.g.dart';

@freezed
class SamplePostModel extends BaseEntity<SamplePostModel>
    with _$SamplePostModel {
  const factory SamplePostModel({
    int? id,
    String? title,
    String? body,
    int? userId,
  }) = _SamplePostModel;
  const SamplePostModel._();
  factory SamplePostModel.initial() => const SamplePostModel();
  factory SamplePostModel.fromJson(Map<String, dynamic> data) =>
      _$SamplePostModelFromJson(data);

  @override
  SamplePostModel fromJson(data) {
    return SamplePostModel.fromJson(data as Map<String, dynamic>);
  }
}
