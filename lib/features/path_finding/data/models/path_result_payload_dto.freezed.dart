// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_result_payload_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathResultPayloadDto {

 List<ResultGridPointDto> get steps; String get path;
/// Create a copy of PathResultPayloadDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathResultPayloadDtoCopyWith<PathResultPayloadDto> get copyWith => _$PathResultPayloadDtoCopyWithImpl<PathResultPayloadDto>(this as PathResultPayloadDto, _$identity);

  /// Serializes this PathResultPayloadDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PathResultPayloadDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathResultPayloadDto&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&(identical(other.path, _this.path) || other.path == _this.path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PathResultPayloadDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.steps),_this.path);
}

@override
String toString() {
  final _this = this as PathResultPayloadDto;
  return 'PathResultPayloadDto(steps: ${_this.steps}, path: ${_this.path})';
}


}

/// @nodoc
abstract mixin class $PathResultPayloadDtoCopyWith<$Res>  {
  factory $PathResultPayloadDtoCopyWith(PathResultPayloadDto value, $Res Function(PathResultPayloadDto) _then) = _$PathResultPayloadDtoCopyWithImpl;
@useResult
$Res call({
 List<ResultGridPointDto> steps, String path
});




}
/// @nodoc
class _$PathResultPayloadDtoCopyWithImpl<$Res>
    implements $PathResultPayloadDtoCopyWith<$Res> {
  _$PathResultPayloadDtoCopyWithImpl(this._self, this._then);

  final PathResultPayloadDto _self;
  final $Res Function(PathResultPayloadDto) _then;

/// Create a copy of PathResultPayloadDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? path = null,}) {
  return _then(PathResultPayloadDto(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<ResultGridPointDto>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PathResultPayloadDto].
extension PathResultPayloadDtoPatterns on PathResultPayloadDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathResultPayloadDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathResultPayloadDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathResultPayloadDto value)  $default,){
final _that = this;
switch (_that) {
case _PathResultPayloadDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathResultPayloadDto value)?  $default,){
final _that = this;
switch (_that) {
case _PathResultPayloadDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ResultGridPointDto> steps,  String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathResultPayloadDto() when $default != null:
return $default(_that.steps,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ResultGridPointDto> steps,  String path)  $default,) {final _that = this;
switch (_that) {
case _PathResultPayloadDto():
return $default(_that.steps,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ResultGridPointDto> steps,  String path)?  $default,) {final _that = this;
switch (_that) {
case _PathResultPayloadDto() when $default != null:
return $default(_that.steps,_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathResultPayloadDto implements PathResultPayloadDto {
  const _PathResultPayloadDto({required  List<ResultGridPointDto> steps, required this.path}): _steps = steps;
  factory _PathResultPayloadDto.fromJson(Map<String, dynamic> json) => _$PathResultPayloadDtoFromJson(json);

 final  List<ResultGridPointDto> _steps;
@override List<ResultGridPointDto> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  String path;

/// Create a copy of PathResultPayloadDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathResultPayloadDtoCopyWith<_PathResultPayloadDto> get copyWith => __$PathResultPayloadDtoCopyWithImpl<_PathResultPayloadDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathResultPayloadDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathResultPayloadDto&&const DeepCollectionEquality().equals(other.steps, _steps)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_steps),path);
}

@override
String toString() {
    return 'PathResultPayloadDto(steps: $steps, path: $path)';
}


}

/// @nodoc
abstract mixin class _$PathResultPayloadDtoCopyWith<$Res> implements $PathResultPayloadDtoCopyWith<$Res> {
  factory _$PathResultPayloadDtoCopyWith(_PathResultPayloadDto value, $Res Function(_PathResultPayloadDto) _then) = __$PathResultPayloadDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ResultGridPointDto> steps, String path
});




}
/// @nodoc
class __$PathResultPayloadDtoCopyWithImpl<$Res>
    implements _$PathResultPayloadDtoCopyWith<$Res> {
  __$PathResultPayloadDtoCopyWithImpl(this._self, this._then);

  final _PathResultPayloadDto _self;
  final $Res Function(_PathResultPayloadDto) _then;

/// Create a copy of PathResultPayloadDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? path = null,}) {
  return _then(_PathResultPayloadDto(
steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<ResultGridPointDto>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
