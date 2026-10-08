// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GridPoint {

 int get x; int get y;
/// Create a copy of GridPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridPointCopyWith<GridPoint> get copyWith => _$GridPointCopyWithImpl<GridPoint>(this as GridPoint, _$identity);

  /// Serializes this GridPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GridPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridPoint&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GridPoint;
  return Object.hash(runtimeType,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as GridPoint;
  return 'GridPoint(x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $GridPointCopyWith<$Res>  {
  factory $GridPointCopyWith(GridPoint value, $Res Function(GridPoint) _then) = _$GridPointCopyWithImpl;
@useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class _$GridPointCopyWithImpl<$Res>
    implements $GridPointCopyWith<$Res> {
  _$GridPointCopyWithImpl(this._self, this._then);

  final GridPoint _self;
  final $Res Function(GridPoint) _then;

/// Create a copy of GridPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(GridPoint(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GridPoint].
extension GridPointPatterns on GridPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridPoint value)  $default,){
final _that = this;
switch (_that) {
case _GridPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridPoint value)?  $default,){
final _that = this;
switch (_that) {
case _GridPoint() when $default != null:
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
case _GridPoint() when $default != null:
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
case _GridPoint():
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
case _GridPoint() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GridPoint implements GridPoint {
  const _GridPoint({required this.x, required this.y});
  factory _GridPoint.fromJson(Map<String, dynamic> json) => _$GridPointFromJson(json);

@override final  int x;
@override final  int y;

/// Create a copy of GridPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridPointCopyWith<_GridPoint> get copyWith => __$GridPointCopyWithImpl<_GridPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GridPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridPoint&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y);
}

@override
String toString() {
    return 'GridPoint(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$GridPointCopyWith<$Res> implements $GridPointCopyWith<$Res> {
  factory _$GridPointCopyWith(_GridPoint value, $Res Function(_GridPoint) _then) = __$GridPointCopyWithImpl;
@override @useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class __$GridPointCopyWithImpl<$Res>
    implements _$GridPointCopyWith<$Res> {
  __$GridPointCopyWithImpl(this._self, this._then);

  final _GridPoint _self;
  final $Res Function(_GridPoint) _then;

/// Create a copy of GridPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_GridPoint(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
