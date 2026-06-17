import 'package:ai_chat/src/domain/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService implements AuthService {
  const SupabaseAuthService({required this._client});

  final SupabaseClient _client;

  @override
  Stream<Map<String, dynamic>?> get authStateChanges {
    return _client.auth.onAuthStateChange.map((event) {
      final session = event.session;

      if (session == null) return null;

      return {
        'accessToken': session.accessToken,
        'refreshToken': session.refreshToken,

        'providerToken': session.providerToken,
        'providerRefreshToken': session.providerRefreshToken,

        'expiresIn': session.expiresIn,
      };
    });
  }

  @override
  Future<void> signOut() => _client.auth.signOut();
}
