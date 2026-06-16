// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState()';
}


}

/// @nodoc
class $SignInStateCopyWith<$Res>  {
$SignInStateCopyWith(SignInState _, $Res Function(SignInState) __);
}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SignInInitial value)?  initial,TResult Function( _SignInLoading value)?  loading,TResult Function( _SignInSuccess value)?  success,TResult Function( _SignInError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInInitial() when initial != null:
return initial(_that);case _SignInLoading() when loading != null:
return loading(_that);case _SignInSuccess() when success != null:
return success(_that);case _SignInError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SignInInitial value)  initial,required TResult Function( _SignInLoading value)  loading,required TResult Function( _SignInSuccess value)  success,required TResult Function( _SignInError value)  error,}){
final _that = this;
switch (_that) {
case _SignInInitial():
return initial(_that);case _SignInLoading():
return loading(_that);case _SignInSuccess():
return success(_that);case _SignInError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SignInInitial value)?  initial,TResult? Function( _SignInLoading value)?  loading,TResult? Function( _SignInSuccess value)?  success,TResult? Function( _SignInError value)?  error,}){
final _that = this;
switch (_that) {
case _SignInInitial() when initial != null:
return initial(_that);case _SignInLoading() when loading != null:
return loading(_that);case _SignInSuccess() when success != null:
return success(_that);case _SignInError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String? error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInInitial() when initial != null:
return initial();case _SignInLoading() when loading != null:
return loading();case _SignInSuccess() when success != null:
return success();case _SignInError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String? error)  error,}) {final _that = this;
switch (_that) {
case _SignInInitial():
return initial();case _SignInLoading():
return loading();case _SignInSuccess():
return success();case _SignInError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String? error)?  error,}) {final _that = this;
switch (_that) {
case _SignInInitial() when initial != null:
return initial();case _SignInLoading() when loading != null:
return loading();case _SignInSuccess() when success != null:
return success();case _SignInError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SignInInitial implements SignInState {
  const _SignInInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.initial()';
}


}




/// @nodoc


class _SignInLoading implements SignInState {
  const _SignInLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.loading()';
}


}




/// @nodoc


class _SignInSuccess implements SignInState {
  const _SignInSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInState.success()';
}


}




/// @nodoc


class _SignInError implements SignInState {
  const _SignInError([this.error]);
  

 final  String? error;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInErrorCopyWith<_SignInError> get copyWith => __$SignInErrorCopyWithImpl<_SignInError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SignInState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignInErrorCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SignInErrorCopyWith(_SignInError value, $Res Function(_SignInError) _then) = __$SignInErrorCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$SignInErrorCopyWithImpl<$Res>
    implements _$SignInErrorCopyWith<$Res> {
  __$SignInErrorCopyWithImpl(this._self, this._then);

  final _SignInError _self;
  final $Res Function(_SignInError) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_SignInError(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
