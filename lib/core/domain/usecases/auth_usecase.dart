import 'package:strong_pass/core/data/repositories/auth_repository_impl.dart';

class AuthUsecase {
  late final AuthRepositoryImpl authRepository;

  AuthUsecase() {
    authRepository = AuthRepositoryImpl();
  }

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    return await authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<void> forgotPassword(String email) async {
    return await authRepository.forgotPassword(email);
  }
}
