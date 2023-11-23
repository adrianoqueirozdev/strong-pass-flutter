import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/core/data/repositories/password_categories_repository_impl.dart';

class PassCategoriesUsecase {
  late PasswordCategoriesRepositoryImpl passwordCategoriesRepository;

  PassCategoriesUsecase() {
    passwordCategoriesRepository = PasswordCategoriesRepositoryImpl();
  }

  Future<List<PasswordCategory>> loadCategories() async {
    return await passwordCategoriesRepository.loadCategories();
  }

  Future<void> incrementCategoryCountPasswords(String categoryId) async {
    await passwordCategoriesRepository.incrementCategoryCountPasswords(categoryId);
  }
}
