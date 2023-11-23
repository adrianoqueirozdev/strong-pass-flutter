import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/data/repositories/password_repository_impl.dart';
import 'package:strong_pass/shared/utils/encrypt_data.dart';

class PasswordUsecase {
  late final PasswordRepositoryImpl passwordRepository;

  PasswordUsecase() {
    passwordRepository = PasswordRepositoryImpl();
  }

  Future<void> createPassword(Password password) async {
    await passwordRepository.createPassword(password);
  }

  Future<List<Password>> loadPasswordsByCategory(String categoryId) async {
    final passwords = await passwordRepository.loadPasswordsByCategory(categoryId);

    for (var password in passwords) {
      password.name = EncryptData.decryptAES(password.name!);
      password.userId = EncryptData.decryptAES(password.userId!);
      password.password = EncryptData.decryptAES(password.password!);
    }

    return passwords;
  }

  Future<void> updatePassword(Password password) async {
    await passwordRepository.updatePassword(password);
  }

  Future<void> deletePassword(String id) async {
    await passwordRepository.deletePassword(id);
  }
}
