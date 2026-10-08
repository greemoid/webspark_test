// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UrlInputState {

 String get url;
/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UrlInputStateCopyWith<UrlInputState> get copyWith => _$UrlInputStateCopyWithImpl<UrlInputState>(this as UrlInputState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UrlInputState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UrlInputState&&(identical(other.url, _this.url) || other.url == _this.url));
}


@override
int get hashCode {
  final _this = this as UrlInputState;
  return Object.hash(runtimeType,_this.url);
}

@override
String toString() {
  final _this = this as UrlInputState;
  return 'UrlInputState(url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $UrlInputStateCopyWith<$Res>  {
  factory $UrlInputStateCopyWith(UrlInputState value, $Res Function(UrlInputState) _then) = _$UrlInputStateCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$UrlInputStateCopyWithImpl<$Res>
    implements $UrlInputStateCopyWith<$Res> {
  _$UrlInputStateCopyWithImpl(this._self, this._then);

  final UrlInputState _self;
  final $Res Function(UrlInputState) _then;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UrlInputState].
extension UrlInputStatePatterns on UrlInputState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Success():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String url)?  initial,TResult Function( String url)?  loading,TResult Function( String url,  String message)?  error,TResult Function( String url)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.url);case _Loading() when loading != null:
return loading(_that.url);case _Error() when error != null:
return error(_that.url,_that.message);case _Success() when success != null:
return success(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String url)  initial,required TResult Function( String url)  loading,required TResult Function( String url,  String message)  error,required TResult Function( String url)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.url);case _Loading():
return loading(_that.url);case _Error():
return error(_that.url,_that.message);case _Success():
return success(_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String url)?  initial,TResult? Function( String url)?  loading,TResult? Function( String url,  String message)?  error,TResult? Function( String url)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.url);case _Loading() when loading != null:
return loading(_that.url);case _Error() when error != null:
return error(_that.url,_that.message);case _Success() when success != null:
return success(_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UrlInputState {
  const _Initial({this.url = ''});
  

@override@JsonKey() final  String url;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'UrlInputState.initial(url: $url)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $UrlInputStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_Initial(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loading implements UrlInputState {
  const _Loading({required this.url});
  

@override final  String url;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'UrlInputState.loading(url: $url)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $UrlInputStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_Loading(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements UrlInputState {
  const _Error({required this.url, required this.message});
  

@override final  String url;
 final  String message;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.url, url) || other.url == url)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url,message);
}

@override
String toString() {
    return 'UrlInputState.error(url: $url, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $UrlInputStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 String url, String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? message = null,}) {
  return _then(_Error(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success implements UrlInputState {
  const _Success({required this.url});
  

@override final  String url;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'UrlInputState.success(url: $url)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $UrlInputStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of UrlInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_Success(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
