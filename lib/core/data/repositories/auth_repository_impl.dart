import 'package:strong_pass/core/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!.uid;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
