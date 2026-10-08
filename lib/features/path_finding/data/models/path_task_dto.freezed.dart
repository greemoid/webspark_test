// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathTaskDto {

 String get id; List<String> get field; TaskGridPointDto get start; TaskGridPointDto get end;
/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathTaskDtoCopyWith<PathTaskDto> get copyWith => _$PathTaskDtoCopyWithImpl<PathTaskDto>(this as PathTaskDto, _$identity);

  /// Serializes this PathTaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PathTaskDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathTaskDto&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.field, _this.field)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PathTaskDto;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.field),_this.start,_this.end);
}

@override
String toString() {
  final _this = this as PathTaskDto;
  return 'PathTaskDto(id: ${_this.id}, field: ${_this.field}, start: ${_this.start}, end: ${_this.end})';
}


}

/// @nodoc
abstract mixin class $PathTaskDtoCopyWith<$Res>  {
  factory $PathTaskDtoCopyWith(PathTaskDto value, $Res Function(PathTaskDto) _then) = _$PathTaskDtoCopyWithImpl;
@useResult
$Res call({
 String id, List<String> field, TaskGridPointDto start, TaskGridPointDto end
});


$TaskGridPointDtoCopyWith<$Res> get start;$TaskGridPointDtoCopyWith<$Res> get end;

}
/// @nodoc
class _$PathTaskDtoCopyWithImpl<$Res>
    implements $PathTaskDtoCopyWith<$Res> {
  _$PathTaskDtoCopyWithImpl(this._self, this._then);

  final PathTaskDto _self;
  final $Res Function(PathTaskDto) _then;

/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? field = null,Object? start = null,Object? end = null,}) {
  return _then(PathTaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as List<String>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TaskGridPointDto,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TaskGridPointDto,
  ));
}
/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskGridPointDtoCopyWith<$Res> get start {
  
  return $TaskGridPointDtoCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskGridPointDtoCopyWith<$Res> get end {
  
  return $TaskGridPointDtoCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}


/// Adds pattern-matching-related methods to [PathTaskDto].
extension PathTaskDtoPatterns on PathTaskDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathTaskDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathTaskDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathTaskDto value)  $default,){
final _that = this;
switch (_that) {
case _PathTaskDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathTaskDto value)?  $default,){
final _that = this;
switch (_that) {
case _PathTaskDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> field,  TaskGridPointDto start,  TaskGridPointDto end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathTaskDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> field,  TaskGridPointDto start,  TaskGridPointDto end)  $default,) {final _that = this;
switch (_that) {
case _PathTaskDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> field,  TaskGridPointDto start,  TaskGridPointDto end)?  $default,) {final _that = this;
switch (_that) {
case _PathTaskDto() when $default != null:
return $default(_that.id,_that.field,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathTaskDto implements PathTaskDto {
  const _PathTaskDto({required this.id, required  List<String> field, required this.start, required this.end}): _field = field;
  factory _PathTaskDto.fromJson(Map<String, dynamic> json) => _$PathTaskDtoFromJson(json);

@override final  String id;
 final  List<String> _field;
@override List<String> get field {
  if (_field is EqualUnmodifiableListView) return _field;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_field);
}

@override final  TaskGridPointDto start;
@override final  TaskGridPointDto end;

/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathTaskDtoCopyWith<_PathTaskDto> get copyWith => __$PathTaskDtoCopyWithImpl<_PathTaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathTaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathTaskDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.field, _field)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_field),start,end);
}

@override
String toString() {
    return 'PathTaskDto(id: $id, field: $field, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$PathTaskDtoCopyWith<$Res> implements $PathTaskDtoCopyWith<$Res> {
  factory _$PathTaskDtoCopyWith(_PathTaskDto value, $Res Function(_PathTaskDto) _then) = __$PathTaskDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> field, TaskGridPointDto start, TaskGridPointDto end
});


@override $TaskGridPointDtoCopyWith<$Res> get start;@override $TaskGridPointDtoCopyWith<$Res> get end;

}
/// @nodoc
class __$PathTaskDtoCopyWithImpl<$Res>
    implements _$PathTaskDtoCopyWith<$Res> {
  __$PathTaskDtoCopyWithImpl(this._self, this._then);

  final _PathTaskDto _self;
  final $Res Function(_PathTaskDto) _then;

/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? field = null,Object? start = null,Object? end = null,}) {
  return _then(_PathTaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self._field : field // ignore: cast_nullable_to_non_nullable
as List<String>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TaskGridPointDto,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TaskGridPointDto,
  ));
}

/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskGridPointDtoCopyWith<$Res> get start {
  
  return $TaskGridPointDtoCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of PathTaskDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskGridPointDtoCopyWith<$Res> get end {
  
  return $TaskGridPointDtoCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}

// dart format on
