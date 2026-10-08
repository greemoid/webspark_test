// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PathResult {

 String get id; List<GridPoint> get steps; String get path;
/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathResultCopyWith<PathResult> get copyWith => _$PathResultCopyWithImpl<PathResult>(this as PathResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PathResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathResult&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&(identical(other.path, _this.path) || other.path == _this.path));
}


@override
int get hashCode {
  final _this = this as PathResult;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.steps),_this.path);
}

@override
String toString() {
  final _this = this as PathResult;
  return 'PathResult(id: ${_this.id}, steps: ${_this.steps}, path: ${_this.path})';
}


}

/// @nodoc
abstract mixin class $PathResultCopyWith<$Res>  {
  factory $PathResultCopyWith(PathResult value, $Res Function(PathResult) _then) = _$PathResultCopyWithImpl;
@useResult
$Res call({
 String id, List<GridPoint> steps, String path
});




}
/// @nodoc
class _$PathResultCopyWithImpl<$Res>
    implements $PathResultCopyWith<$Res> {
  _$PathResultCopyWithImpl(this._self, this._then);

  final PathResult _self;
  final $Res Function(PathResult) _then;

/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? steps = null,Object? path = null,}) {
  return _then(PathResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<GridPoint>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PathResult].
extension PathResultPatterns on PathResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathResult value)  $default,){
final _that = this;
switch (_that) {
case _PathResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathResult value)?  $default,){
final _that = this;
switch (_that) {
case _PathResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<GridPoint> steps,  String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathResult() when $default != null:
return $default(_that.id,_that.steps,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<GridPoint> steps,  String path)  $default,) {final _that = this;
switch (_that) {
case _PathResult():
return $default(_that.id,_that.steps,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<GridPoint> steps,  String path)?  $default,) {final _that = this;
switch (_that) {
case _PathResult() when $default != null:
return $default(_that.id,_that.steps,_that.path);case _:
  return null;

}
}

}

/// @nodoc


class _PathResult implements PathResult {
  const _PathResult({required this.id, required  List<GridPoint> steps, required this.path}): _steps = steps;
  

@override final  String id;
 final  List<GridPoint> _steps;
@override List<GridPoint> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  String path;

/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathResultCopyWith<_PathResult> get copyWith => __$PathResultCopyWithImpl<_PathResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathResult&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.steps, _steps)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_steps),path);
}

@override
String toString() {
    return 'PathResult(id: $id, steps: $steps, path: $path)';
}


}

/// @nodoc
abstract mixin class _$PathResultCopyWith<$Res> implements $PathResultCopyWith<$Res> {
  factory _$PathResultCopyWith(_PathResult value, $Res Function(_PathResult) _then) = __$PathResultCopyWithImpl;
@override @useResult
$Res call({
 String id, List<GridPoint> steps, String path
});




}
/// @nodoc
class __$PathResultCopyWithImpl<$Res>
    implements _$PathResultCopyWith<$Res> {
  __$PathResultCopyWithImpl(this._self, this._then);

  final _PathResult _self;
  final $Res Function(_PathResult) _then;

/// Create a copy of PathResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? steps = null,Object? path = null,}) {
  return _then(_PathResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<GridPoint>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
