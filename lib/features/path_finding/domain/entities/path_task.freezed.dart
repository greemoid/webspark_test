// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PathTask {

 String get id; List<String> get field; GridPoint get start; GridPoint get end;
/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathTaskCopyWith<PathTask> get copyWith => _$PathTaskCopyWithImpl<PathTask>(this as PathTask, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PathTask;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathTask&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.field, _this.field)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end));
}


@override
int get hashCode {
  final _this = this as PathTask;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.field),_this.start,_this.end);
}

@override
String toString() {
  final _this = this as PathTask;
  return 'PathTask(id: ${_this.id}, field: ${_this.field}, start: ${_this.start}, end: ${_this.end})';
}


}

/// @nodoc
abstract mixin class $PathTaskCopyWith<$Res>  {
  factory $PathTaskCopyWith(PathTask value, $Res Function(PathTask) _then) = _$PathTaskCopyWithImpl;
@useResult
$Res call({
 String id, List<String> field, GridPoint start, GridPoint end
});


$GridPointCopyWith<$Res> get start;$GridPointCopyWith<$Res> get end;

}
/// @nodoc
class _$PathTaskCopyWithImpl<$Res>
    implements $PathTaskCopyWith<$Res> {
  _$PathTaskCopyWithImpl(this._self, this._then);

  final PathTask _self;
  final $Res Function(PathTask) _then;

/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? field = null,Object? start = null,Object? end = null,}) {
  return _then(PathTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as List<String>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as GridPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as GridPoint,
  ));
}
/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridPointCopyWith<$Res> get start {
  
  return $GridPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridPointCopyWith<$Res> get end {
  
  return $GridPointCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}


/// Adds pattern-matching-related methods to [PathTask].
extension PathTaskPatterns on PathTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathTask value)  $default,){
final _that = this;
switch (_that) {
case _PathTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathTask value)?  $default,){
final _that = this;
switch (_that) {
case _PathTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> field,  GridPoint start,  GridPoint end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathTask() when $default != null:
return $default(_that.id,_that.field,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> field,  GridPoint start,  GridPoint end)  $default,) {final _that = this;
switch (_that) {
case _PathTask():
return $default(_that.id,_that.field,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> field,  GridPoint start,  GridPoint end)?  $default,) {final _that = this;
switch (_that) {
case _PathTask() when $default != null:
return $default(_that.id,_that.field,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc


class _PathTask implements PathTask {
  const _PathTask({required this.id, required  List<String> field, required this.start, required this.end}): _field = field;
  

@override final  String id;
 final  List<String> _field;
@override List<String> get field {
  if (_field is EqualUnmodifiableListView) return _field;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_field);
}

@override final  GridPoint start;
@override final  GridPoint end;

/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathTaskCopyWith<_PathTask> get copyWith => __$PathTaskCopyWithImpl<_PathTask>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathTask&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.field, _field)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_field),start,end);
}

@override
String toString() {
    return 'PathTask(id: $id, field: $field, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$PathTaskCopyWith<$Res> implements $PathTaskCopyWith<$Res> {
  factory _$PathTaskCopyWith(_PathTask value, $Res Function(_PathTask) _then) = __$PathTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> field, GridPoint start, GridPoint end
});


@override $GridPointCopyWith<$Res> get start;@override $GridPointCopyWith<$Res> get end;

}
/// @nodoc
class __$PathTaskCopyWithImpl<$Res>
    implements _$PathTaskCopyWith<$Res> {
  __$PathTaskCopyWithImpl(this._self, this._then);

  final _PathTask _self;
  final $Res Function(_PathTask) _then;

/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? field = null,Object? start = null,Object? end = null,}) {
  return _then(_PathTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self._field : field // ignore: cast_nullable_to_non_nullable
as List<String>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as GridPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as GridPoint,
  ));
}

/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridPointCopyWith<$Res> get start {
  
  return $GridPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of PathTask
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridPointCopyWith<$Res> get end {
  
  return $GridPointCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}

// dart format on
