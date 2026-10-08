// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponseDto<T> _$BaseResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BaseResponseDto<T>(
  error: json['error'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$BaseResponseDtoToJson<T>(
  _BaseResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'data': instance.data.map(toJsonT).toList(),
};
