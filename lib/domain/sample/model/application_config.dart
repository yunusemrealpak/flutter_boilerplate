import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/network/models/base_entity.dart';

part 'application_config.freezed.dart';
part 'application_config.g.dart';

@freezed
class ApplicationConfig extends BaseEntity<ApplicationConfig>
    with _$ApplicationConfig {
  const factory ApplicationConfig({
    int? shoutTime,
    int? eventTime,
    String? mapStyle,
    String? mapAccessToken,
    String? termAndCondition,
    bool? isMapActive,
    int? mapType,
    bool? isMapZoomButtonActive,
  }) = _ApplicationConfig;

  const ApplicationConfig._();
  factory ApplicationConfig.initial() => const ApplicationConfig();
  factory ApplicationConfig.fromJson(Map<String, dynamic> data) =>
      _$ApplicationConfigFromJson(data);

  @override
  ApplicationConfig fromJson(dynamic data) {
    return ApplicationConfig.fromJson(data as Map<String, dynamic>);
  }
}
