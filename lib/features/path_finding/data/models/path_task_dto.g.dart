// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PathTaskDto _$PathTaskDtoFromJson(Map<String, dynamic> json) => _PathTaskDto(
  id: json['id'] as String,
  field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
  start: TaskGridPointDto.fromJson(json['start'] as Map<String, dynamic>),
  end: TaskGridPointDto.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PathTaskDtoToJson(_PathTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'field': instance.field,
      'start': instance.start,
      'end': instance.end,
    };
