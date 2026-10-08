// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProcessingState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProcessingState()';
}


}

/// @nodoc
class $ProcessingStateCopyWith<$Res>  {
$ProcessingStateCopyWith(ProcessingState _, $Res Function(ProcessingState) __);
}


/// Adds pattern-matching-related methods to [ProcessingState].
extension ProcessingStatePatterns on ProcessingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingTasks value)?  loadingTasks,TResult Function( _Calculating value)?  calculating,TResult Function( _Ready value)?  ready,TResult Function( _Submitting value)?  submitting,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingTasks() when loadingTasks != null:
return loadingTasks(_that);case _Calculating() when calculating != null:
return calculating(_that);case _Ready() when ready != null:
return ready(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingTasks value)  loadingTasks,required TResult Function( _Calculating value)  calculating,required TResult Function( _Ready value)  ready,required TResult Function( _Submitting value)  submitting,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingTasks():
return loadingTasks(_that);case _Calculating():
return calculating(_that);case _Ready():
return ready(_that);case _Submitting():
return submitting(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingTasks value)?  loadingTasks,TResult? Function( _Calculating value)?  calculating,TResult? Function( _Ready value)?  ready,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingTasks() when loadingTasks != null:
return loadingTasks(_that);case _Calculating() when calculating != null:
return calculating(_that);case _Ready() when ready != null:
return ready(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingTasks,TResult Function( int completed,  int total)?  calculating,TResult Function( List<PathResult> results,  String? submissionError)?  ready,TResult Function( List<PathResult> results)?  submitting,TResult Function( List<PathResult> results)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingTasks() when loadingTasks != null:
return loadingTasks();case _Calculating() when calculating != null:
return calculating(_that.completed,_that.total);case _Ready() when ready != null:
return ready(_that.results,_that.submissionError);case _Submitting() when submitting != null:
return submitting(_that.results);case _Success() when success != null:
return success(_that.results);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingTasks,required TResult Function( int completed,  int total)  calculating,required TResult Function( List<PathResult> results,  String? submissionError)  ready,required TResult Function( List<PathResult> results)  submitting,required TResult Function( List<PathResult> results)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingTasks():
return loadingTasks();case _Calculating():
return calculating(_that.completed,_that.total);case _Ready():
return ready(_that.results,_that.submissionError);case _Submitting():
return submitting(_that.results);case _Success():
return success(_that.results);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingTasks,TResult? Function( int completed,  int total)?  calculating,TResult? Function( List<PathResult> results,  String? submissionError)?  ready,TResult? Function( List<PathResult> results)?  submitting,TResult? Function( List<PathResult> results)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingTasks() when loadingTasks != null:
return loadingTasks();case _Calculating() when calculating != null:
return calculating(_that.completed,_that.total);case _Ready() when ready != null:
return ready(_that.results,_that.submissionError);case _Submitting() when submitting != null:
return submitting(_that.results);case _Success() when success != null:
return success(_that.results);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProcessingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProcessingState.initial()';
}


}




/// @nodoc


class _LoadingTasks implements ProcessingState {
  const _LoadingTasks();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingTasks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProcessingState.loadingTasks()';
}


}




/// @nodoc


class _Calculating implements ProcessingState {
  const _Calculating({required this.completed, required this.total});
  

 final  int completed;
 final  int total;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatingCopyWith<_Calculating> get copyWith => __$CalculatingCopyWithImpl<_Calculating>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calculating&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode {
    return Object.hash(runtimeType,completed,total);
}

@override
String toString() {
    return 'ProcessingState.calculating(completed: $completed, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CalculatingCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$CalculatingCopyWith(_Calculating value, $Res Function(_Calculating) _then) = __$CalculatingCopyWithImpl;
@useResult
$Res call({
 int completed, int total
});




}
/// @nodoc
class __$CalculatingCopyWithImpl<$Res>
    implements _$CalculatingCopyWith<$Res> {
  __$CalculatingCopyWithImpl(this._self, this._then);

  final _Calculating _self;
  final $Res Function(_Calculating) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completed = null,Object? total = null,}) {
  return _then(_Calculating(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Ready implements ProcessingState {
  const _Ready({required  List<PathResult> results, this.submissionError}): _results = results;
  

 final  List<PathResult> _results;
 List<PathResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  String? submissionError;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.submissionError, submissionError) || other.submissionError == submissionError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),submissionError);
}

@override
String toString() {
    return 'ProcessingState.ready(results: $results, submissionError: $submissionError)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 List<PathResult> results, String? submissionError
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,Object? submissionError = freezed,}) {
  return _then(_Ready(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PathResult>,submissionError: freezed == submissionError ? _self.submissionError : submissionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Submitting implements ProcessingState {
  const _Submitting({required  List<PathResult> results}): _results = results;
  

 final  List<PathResult> _results;
 List<PathResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingCopyWith<_Submitting> get copyWith => __$SubmittingCopyWithImpl<_Submitting>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting&&const DeepCollectionEquality().equals(other.results, _results));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'ProcessingState.submitting(results: $results)';
}


}

/// @nodoc
abstract mixin class _$SubmittingCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$SubmittingCopyWith(_Submitting value, $Res Function(_Submitting) _then) = __$SubmittingCopyWithImpl;
@useResult
$Res call({
 List<PathResult> results
});




}
/// @nodoc
class __$SubmittingCopyWithImpl<$Res>
    implements _$SubmittingCopyWith<$Res> {
  __$SubmittingCopyWithImpl(this._self, this._then);

  final _Submitting _self;
  final $Res Function(_Submitting) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_Submitting(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PathResult>,
  ));
}


}

/// @nodoc


class _Success implements ProcessingState {
  const _Success({required  List<PathResult> results}): _results = results;
  

 final  List<PathResult> _results;
 List<PathResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other.results, _results));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'ProcessingState.success(results: $results)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<PathResult> results
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_Success(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PathResult>,
  ));
}


}

/// @nodoc


class _Failure implements ProcessingState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ProcessingState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ProcessingStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
