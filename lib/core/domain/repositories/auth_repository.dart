import 'package:strong_pass/core/domain/repositories/base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  Future<String?> signInWithEmailAndPassword(String email, String password);

  Future<void> forgotPassword(String email);
}
