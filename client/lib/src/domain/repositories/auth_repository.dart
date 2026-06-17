import 'package:ai_chat/src/domain/models/auth_state.dart';

abstract class AuthRepository {
  Stream<AuthState?> get authStateChanges;

  Future<void> signOut();
}
