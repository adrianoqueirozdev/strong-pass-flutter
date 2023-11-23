import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/domain/repositories/base_repository.dart';

abstract class PasswordRepository extends BaseRepository {
  Future<List<Password>> loadPasswordsByCategory(String categoryId);

  Future<void> createPassword(Password password);

  Future<void> updatePassword(Password password);

  Future<void> deletePassword(String id);
}
