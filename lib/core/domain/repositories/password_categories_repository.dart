import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/core/domain/repositories/base_repository.dart';

abstract class PasswordCategoriesRepository extends BaseRepository {
  Future<List<PasswordCategory>> loadCategories();

  Future<void> incrementCategoryCountPasswords(String categoryId);
}
