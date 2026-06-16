import 'package:ai_chat/src/domain/repositories/sign_in_repository.dart';
import 'package:ai_chat/src/domain/services/sign_in_service.dart';

class SignInRepositoryImpl implements SignInRepository {
  const SignInRepositoryImpl({required this._signInService});

  final SignInService _signInService;

  @override
  Future<void> signInWithApple() => _signInService.signInWithApple();
}
