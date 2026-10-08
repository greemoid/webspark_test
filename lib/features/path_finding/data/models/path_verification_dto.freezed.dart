// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_verification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathVerificationDto {

 String get id; bool get correct;
/// Create a copy of PathVerificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathVerificationDtoCopyWith<PathVerificationDto> get copyWith => _$PathVerificationDtoCopyWithImpl<PathVerificationDto>(this as PathVerificationDto, _$identity);

  /// Serializes this PathVerificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PathVerificationDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathVerificationDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.correct, _this.correct) || other.correct == _this.correct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PathVerificationDto;
  return Object.hash(runtimeType,_this.id,_this.correct);
}

@override
String toString() {
  final _this = this as PathVerificationDto;
  return 'PathVerificationDto(id: ${_this.id}, correct: ${_this.correct})';
}


}

/// @nodoc
abstract mixin class $PathVerificationDtoCopyWith<$Res>  {
  factory $PathVerificationDtoCopyWith(PathVerificationDto value, $Res Function(PathVerificationDto) _then) = _$PathVerificationDtoCopyWithImpl;
@useResult
$Res call({
 String id, bool correct
});




}
/// @nodoc
class _$PathVerificationDtoCopyWithImpl<$Res>
    implements $PathVerificationDtoCopyWith<$Res> {
  _$PathVerificationDtoCopyWithImpl(this._self, this._then);

  final PathVerificationDto _self;
  final $Res Function(PathVerificationDto) _then;

/// Create a copy of PathVerificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? correct = null,}) {
  return _then(PathVerificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PathVerificationDto].
extension PathVerificationDtoPatterns on PathVerificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathVerificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathVerificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathVerificationDto value)  $default,){
final _that = this;
switch (_that) {
case _PathVerificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathVerificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _PathVerificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool correct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathVerificationDto() when $default != null:
return $default(_that.id,_that.correct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool correct)  $default,) {final _that = this;
switch (_that) {
case _PathVerificationDto():
return $default(_that.id,_that.correct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool correct)?  $default,) {final _that = this;
switch (_that) {
case _PathVerificationDto() when $default != null:
return $default(_that.id,_that.correct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathVerificationDto implements PathVerificationDto {
  const _PathVerificationDto({required this.id, required this.correct});
  factory _PathVerificationDto.fromJson(Map<String, dynamic> json) => _$PathVerificationDtoFromJson(json);

@override final  String id;
@override final  bool correct;

/// Create a copy of PathVerificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathVerificationDtoCopyWith<_PathVerificationDto> get copyWith => __$PathVerificationDtoCopyWithImpl<_PathVerificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathVerificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathVerificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.correct, correct) || other.correct == correct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,correct);
}

@override
String toString() {
    return 'PathVerificationDto(id: $id, correct: $correct)';
}


}

/// @nodoc
abstract mixin class _$PathVerificationDtoCopyWith<$Res> implements $PathVerificationDtoCopyWith<$Res> {
  factory _$PathVerificationDtoCopyWith(_PathVerificationDto value, $Res Function(_PathVerificationDto) _then) = __$PathVerificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, bool correct
});




}
/// @nodoc
class __$PathVerificationDtoCopyWithImpl<$Res>
    implements _$PathVerificationDtoCopyWith<$Res> {
  __$PathVerificationDtoCopyWithImpl(this._self, this._then);

  final _PathVerificationDto _self;
  final $Res Function(_PathVerificationDto) _then;

/// Create a copy of PathVerificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? correct = null,}) {
  return _then(_PathVerificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
