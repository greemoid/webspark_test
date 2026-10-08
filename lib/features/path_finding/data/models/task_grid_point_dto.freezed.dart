// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_grid_point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskGridPointDto {

 int get x; int get y;
/// Create a copy of TaskGridPointDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskGridPointDtoCopyWith<TaskGridPointDto> get copyWith => _$TaskGridPointDtoCopyWithImpl<TaskGridPointDto>(this as TaskGridPointDto, _$identity);

  /// Serializes this TaskGridPointDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskGridPointDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskGridPointDto&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskGridPointDto;
  return Object.hash(runtimeType,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as TaskGridPointDto;
  return 'TaskGridPointDto(x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $TaskGridPointDtoCopyWith<$Res>  {
  factory $TaskGridPointDtoCopyWith(TaskGridPointDto value, $Res Function(TaskGridPointDto) _then) = _$TaskGridPointDtoCopyWithImpl;
@useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class _$TaskGridPointDtoCopyWithImpl<$Res>
    implements $TaskGridPointDtoCopyWith<$Res> {
  _$TaskGridPointDtoCopyWithImpl(this._self, this._then);

  final TaskGridPointDto _self;
  final $Res Function(TaskGridPointDto) _then;

/// Create a copy of TaskGridPointDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(TaskGridPointDto(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskGridPointDto].
extension TaskGridPointDtoPatterns on TaskGridPointDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskGridPointDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskGridPointDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskGridPointDto value)  $default,){
final _that = this;
switch (_that) {
case _TaskGridPointDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskGridPointDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaskGridPointDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int x,  int y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskGridPointDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int x,  int y)  $default,) {final _that = this;
switch (_that) {
case _TaskGridPointDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int x,  int y)?  $default,) {final _that = this;
switch (_that) {
case _TaskGridPointDto() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskGridPointDto implements TaskGridPointDto {
  const _TaskGridPointDto({required this.x, required this.y});
  factory _TaskGridPointDto.fromJson(Map<String, dynamic> json) => _$TaskGridPointDtoFromJson(json);

@override final  int x;
@override final  int y;

/// Create a copy of TaskGridPointDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskGridPointDtoCopyWith<_TaskGridPointDto> get copyWith => __$TaskGridPointDtoCopyWithImpl<_TaskGridPointDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskGridPointDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskGridPointDto&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y);
}

@override
String toString() {
    return 'TaskGridPointDto(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$TaskGridPointDtoCopyWith<$Res> implements $TaskGridPointDtoCopyWith<$Res> {
  factory _$TaskGridPointDtoCopyWith(_TaskGridPointDto value, $Res Function(_TaskGridPointDto) _then) = __$TaskGridPointDtoCopyWithImpl;
@override @useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class __$TaskGridPointDtoCopyWithImpl<$Res>
    implements _$TaskGridPointDtoCopyWith<$Res> {
  __$TaskGridPointDtoCopyWithImpl(this._self, this._then);

  final _TaskGridPointDto _self;
  final $Res Function(_TaskGridPointDto) _then;

/// Create a copy of TaskGridPointDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_TaskGridPointDto(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
