// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_result_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathResultRequestDto {

 String get id; PathResultPayloadDto get result;
/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathResultRequestDtoCopyWith<PathResultRequestDto> get copyWith => _$PathResultRequestDtoCopyWithImpl<PathResultRequestDto>(this as PathResultRequestDto, _$identity);

  /// Serializes this PathResultRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PathResultRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathResultRequestDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.result, _this.result) || other.result == _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PathResultRequestDto;
  return Object.hash(runtimeType,_this.id,_this.result);
}

@override
String toString() {
  final _this = this as PathResultRequestDto;
  return 'PathResultRequestDto(id: ${_this.id}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $PathResultRequestDtoCopyWith<$Res>  {
  factory $PathResultRequestDtoCopyWith(PathResultRequestDto value, $Res Function(PathResultRequestDto) _then) = _$PathResultRequestDtoCopyWithImpl;
@useResult
$Res call({
 String id, PathResultPayloadDto result
});


$PathResultPayloadDtoCopyWith<$Res> get result;

}
/// @nodoc
class _$PathResultRequestDtoCopyWithImpl<$Res>
    implements $PathResultRequestDtoCopyWith<$Res> {
  _$PathResultRequestDtoCopyWithImpl(this._self, this._then);

  final PathResultRequestDto _self;
  final $Res Function(PathResultRequestDto) _then;

/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? result = null,}) {
  return _then(PathResultRequestDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PathResultPayloadDto,
  ));
}
/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PathResultPayloadDtoCopyWith<$Res> get result {
  
  return $PathResultPayloadDtoCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [PathResultRequestDto].
extension PathResultRequestDtoPatterns on PathResultRequestDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathResultRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathResultRequestDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathResultRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _PathResultRequestDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathResultRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _PathResultRequestDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PathResultPayloadDto result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathResultRequestDto() when $default != null:
return $default(_that.id,_that.result);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PathResultPayloadDto result)  $default,) {final _that = this;
switch (_that) {
case _PathResultRequestDto():
return $default(_that.id,_that.result);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PathResultPayloadDto result)?  $default,) {final _that = this;
switch (_that) {
case _PathResultRequestDto() when $default != null:
return $default(_that.id,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathResultRequestDto implements PathResultRequestDto {
  const _PathResultRequestDto({required this.id, required this.result});
  factory _PathResultRequestDto.fromJson(Map<String, dynamic> json) => _$PathResultRequestDtoFromJson(json);

@override final  String id;
@override final  PathResultPayloadDto result;

/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathResultRequestDtoCopyWith<_PathResultRequestDto> get copyWith => __$PathResultRequestDtoCopyWithImpl<_PathResultRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathResultRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathResultRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,result);
}

@override
String toString() {
    return 'PathResultRequestDto(id: $id, result: $result)';
}


}

/// @nodoc
abstract mixin class _$PathResultRequestDtoCopyWith<$Res> implements $PathResultRequestDtoCopyWith<$Res> {
  factory _$PathResultRequestDtoCopyWith(_PathResultRequestDto value, $Res Function(_PathResultRequestDto) _then) = __$PathResultRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, PathResultPayloadDto result
});


@override $PathResultPayloadDtoCopyWith<$Res> get result;

}
/// @nodoc
class __$PathResultRequestDtoCopyWithImpl<$Res>
    implements _$PathResultRequestDtoCopyWith<$Res> {
  __$PathResultRequestDtoCopyWithImpl(this._self, this._then);

  final _PathResultRequestDto _self;
  final $Res Function(_PathResultRequestDto) _then;

/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? result = null,}) {
  return _then(_PathResultRequestDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PathResultPayloadDto,
  ));
}

/// Create a copy of PathResultRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PathResultPayloadDtoCopyWith<$Res> get result {
  
  return $PathResultPayloadDtoCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
