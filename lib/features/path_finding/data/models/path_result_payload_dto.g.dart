// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_result_payload_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PathResultPayloadDto _$PathResultPayloadDtoFromJson(
  Map<String, dynamic> json,
) => _PathResultPayloadDto(
  steps: (json['steps'] as List<dynamic>)
      .map((e) => ResultGridPointDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  path: json['path'] as String,
);

Map<String, dynamic> _$PathResultPayloadDtoToJson(
  _PathResultPayloadDto instance,
) => <String, dynamic>{'steps': instance.steps, 'path': instance.path};
