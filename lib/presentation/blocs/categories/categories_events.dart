abstract class CategoriesEvent {}

class LoadCategoriesEvent extends CategoriesEvent {}

class IncrementCategoryCountPasswords extends CategoriesEvent {
  String categoryId;

  IncrementCategoryCountPasswords({required this.categoryId});
}
