import 'package:ai_chat/src/domain/models/auth_state.dart';
import 'package:ai_chat/src/domain/repositories/auth_repository.dart';
import 'package:ai_chat/src/domain/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this._authService});

  final AuthService _authService;

  @override
  Stream<AuthState?> get authStateChanges {
    return _authService.authStateChanges.map((authData) {
      if (authData == null) return null;

      return AuthState.fromJson(authData);
    });
  }

  @override
  Future<void> signOut() => _authService.signOut();
}
