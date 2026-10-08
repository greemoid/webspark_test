// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_grid_point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultGridPointDto {

 String get x; String get y;
/// Create a copy of ResultGridPointDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultGridPointDtoCopyWith<ResultGridPointDto> get copyWith => _$ResultGridPointDtoCopyWithImpl<ResultGridPointDto>(this as ResultGridPointDto, _$identity);

  /// Serializes this ResultGridPointDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResultGridPointDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultGridPointDto&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResultGridPointDto;
  return Object.hash(runtimeType,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as ResultGridPointDto;
  return 'ResultGridPointDto(x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $ResultGridPointDtoCopyWith<$Res>  {
  factory $ResultGridPointDtoCopyWith(ResultGridPointDto value, $Res Function(ResultGridPointDto) _then) = _$ResultGridPointDtoCopyWithImpl;
@useResult
$Res call({
 String x, String y
});




}
/// @nodoc
class _$ResultGridPointDtoCopyWithImpl<$Res>
    implements $ResultGridPointDtoCopyWith<$Res> {
  _$ResultGridPointDtoCopyWithImpl(this._self, this._then);

  final ResultGridPointDto _self;
  final $Res Function(ResultGridPointDto) _then;

/// Create a copy of ResultGridPointDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(ResultGridPointDto(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as String,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultGridPointDto].
extension ResultGridPointDtoPatterns on ResultGridPointDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultGridPointDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultGridPointDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultGridPointDto value)  $default,){
final _that = this;
switch (_that) {
case _ResultGridPointDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultGridPointDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResultGridPointDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String x,  String y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultGridPointDto() when $default != null:
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String x,  String y)  $default,) {final _that = this;
switch (_that) {
case _ResultGridPointDto():
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String x,  String y)?  $default,) {final _that = this;
switch (_that) {
case _ResultGridPointDto() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultGridPointDto implements ResultGridPointDto {
  const _ResultGridPointDto({required this.x, required this.y});
  factory _ResultGridPointDto.fromJson(Map<String, dynamic> json) => _$ResultGridPointDtoFromJson(json);

@override final  String x;
@override final  String y;

/// Create a copy of ResultGridPointDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultGridPointDtoCopyWith<_ResultGridPointDto> get copyWith => __$ResultGridPointDtoCopyWithImpl<_ResultGridPointDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultGridPointDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultGridPointDto&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y);
}

@override
String toString() {
    return 'ResultGridPointDto(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$ResultGridPointDtoCopyWith<$Res> implements $ResultGridPointDtoCopyWith<$Res> {
  factory _$ResultGridPointDtoCopyWith(_ResultGridPointDto value, $Res Function(_ResultGridPointDto) _then) = __$ResultGridPointDtoCopyWithImpl;
@override @useResult
$Res call({
 String x, String y
});




}
/// @nodoc
class __$ResultGridPointDtoCopyWithImpl<$Res>
    implements _$ResultGridPointDtoCopyWith<$Res> {
  __$ResultGridPointDtoCopyWithImpl(this._self, this._then);

  final _ResultGridPointDto _self;
  final $Res Function(_ResultGridPointDto) _then;

/// Create a copy of ResultGridPointDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_ResultGridPointDto(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as String,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
