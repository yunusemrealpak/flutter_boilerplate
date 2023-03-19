// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationConfig _$$_ApplicationConfigFromJson(Map<String, dynamic> json) =>
    _$_ApplicationConfig(
      shoutTime: json['shoutTime'] as int?,
      eventTime: json['eventTime'] as int?,
      mapStyle: json['mapStyle'] as String?,
      mapAccessToken: json['mapAccessToken'] as String?,
      termAndCondition: json['termAndCondition'] as String?,
      isMapActive: json['isMapActive'] as bool?,
      mapType: json['mapType'] as int?,
      isMapZoomButtonActive: json['isMapZoomButtonActive'] as bool?,
    );

Map<String, dynamic> _$$_ApplicationConfigToJson(
        _$_ApplicationConfig instance) =>
    <String, dynamic>{
      'shoutTime': instance.shoutTime,
      'eventTime': instance.eventTime,
      'mapStyle': instance.mapStyle,
      'mapAccessToken': instance.mapAccessToken,
      'termAndCondition': instance.termAndCondition,
      'isMapActive': instance.isMapActive,
      'mapType': instance.mapType,
      'isMapZoomButtonActive': instance.isMapZoomButtonActive,
    };
