import 'dart:convert';

import 'package:ai_chat/src/domain/services/sign_in_service.dart';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSignInService implements SignInService {
  const SupabaseSignInService({required this._client});

  final SupabaseClient _client;

  @override
  Future<void> signInWithApple() async {
    final rawNonce = _client.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [.email],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;

    if (idToken == null) {
      throw Exception('Could not find ID Token from generated credential.');
    }

    final response = await _client.auth.signInWithIdToken(
      provider: .apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    if (response.session == null) {
      throw Exception('Failed to sign in with Apple: no session returned.');
    }
  }
}
