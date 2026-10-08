// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_result_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PathResultRequestDto _$PathResultRequestDtoFromJson(
  Map<String, dynamic> json,
) => _PathResultRequestDto(
  id: json['id'] as String,
  result: PathResultPayloadDto.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PathResultRequestDtoToJson(
  _PathResultRequestDto instance,
) => <String, dynamic>{'id': instance.id, 'result': instance.result};
