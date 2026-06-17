import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required String accessToken,
    String? refreshToken,

    String? providerToken,
    String? providerRefreshToken,

    int? expiresIn,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
