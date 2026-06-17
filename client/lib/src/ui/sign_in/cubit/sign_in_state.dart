part of 'sign_in_cubit.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState.initial() = _SignInInitial;
  const factory SignInState.loading() = _SignInLoading;
  const factory SignInState.success() = _SignInSuccess;
  const factory SignInState.error({required String message}) = _SignInError;
}
