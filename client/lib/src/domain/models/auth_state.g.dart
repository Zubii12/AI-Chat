// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String?,
  providerToken: json['providerToken'] as String?,
  providerRefreshToken: json['providerRefreshToken'] as String?,
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'providerToken': instance.providerToken,
      'providerRefreshToken': instance.providerRefreshToken,
      'expiresIn': instance.expiresIn,
    };
