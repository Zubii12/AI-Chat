abstract class AuthService {
  Stream<Map<String, dynamic>?> get authStateChanges;

  Future<void> signOut();
}
