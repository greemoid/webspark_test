// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponseDto<T> {

 bool get error; String get message; List<T> get data;
/// Create a copy of BaseResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseDtoCopyWith<T, BaseResponseDto<T>> get copyWith => _$BaseResponseDtoCopyWithImpl<T, BaseResponseDto<T>>(this as BaseResponseDto<T>, _$identity);

  /// Serializes this BaseResponseDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  final _this = this as BaseResponseDto<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponseDto<T>&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BaseResponseDto<T>;
  return Object.hash(runtimeType,_this.error,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as BaseResponseDto<T>;
  return 'BaseResponseDto<$T>(error: ${_this.error}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $BaseResponseDtoCopyWith<T,$Res>  {
  factory $BaseResponseDtoCopyWith(BaseResponseDto<T> value, $Res Function(BaseResponseDto<T>) _then) = _$BaseResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool error, String message, List<T> data
});




}
/// @nodoc
class _$BaseResponseDtoCopyWithImpl<T,$Res>
    implements $BaseResponseDtoCopyWith<T, $Res> {
  _$BaseResponseDtoCopyWithImpl(this._self, this._then);

  final BaseResponseDto<T> _self;
  final $Res Function(BaseResponseDto<T>) _then;

/// Create a copy of BaseResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? data = null,}) {
  return _then(BaseResponseDto(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseResponseDto].
extension BaseResponseDtoPatterns<T> on BaseResponseDto<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseResponseDto<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseResponseDto<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseResponseDto<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message,  List<T> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseResponseDto() when $default != null:
return $default(_that.error,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message,  List<T> data)  $default,) {final _that = this;
switch (_that) {
case _BaseResponseDto():
return $default(_that.error,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message,  List<T> data)?  $default,) {final _that = this;
switch (_that) {
case _BaseResponseDto() when $default != null:
return $default(_that.error,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponseDto<T> implements BaseResponseDto<T> {
  const _BaseResponseDto({required this.error, required this.message, required  List<T> data}): _data = data;
  factory _BaseResponseDto.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseDtoFromJson(json,fromJsonT);

@override final  bool error;
@override final  String message;
 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of BaseResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseDtoCopyWith<T, _BaseResponseDto<T>> get copyWith => __$BaseResponseDtoCopyWithImpl<T, _BaseResponseDto<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseResponseDtoToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponseDto<T>&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'BaseResponseDto<$T>(error: $error, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseDtoCopyWith<T,$Res> implements $BaseResponseDtoCopyWith<T, $Res> {
  factory _$BaseResponseDtoCopyWith(_BaseResponseDto<T> value, $Res Function(_BaseResponseDto<T>) _then) = __$BaseResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message, List<T> data
});




}
/// @nodoc
class __$BaseResponseDtoCopyWithImpl<T,$Res>
    implements _$BaseResponseDtoCopyWith<T, $Res> {
  __$BaseResponseDtoCopyWithImpl(this._self, this._then);

  final _BaseResponseDto<T> _self;
  final $Res Function(_BaseResponseDto<T>) _then;

/// Create a copy of BaseResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? data = null,}) {
  return _then(_BaseResponseDto<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
