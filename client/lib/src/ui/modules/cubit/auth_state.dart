part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.authenticated() = _AuthAuthenticated;
  const factory AuthState.unauthenticated() = _AuthUnauthenticated;
}
