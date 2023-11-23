import 'package:strong_pass/core/data/models/password_category.dart';

abstract class CategoriesState {
  List<PasswordCategory> passCategories;
  String? error;

  CategoriesState({
    required this.passCategories,
    this.error,
  });
}

class CategoriesInitialState extends CategoriesState {
  CategoriesInitialState() : super(passCategories: []);
}

class CategoriesSuccessState extends CategoriesState {
  CategoriesSuccessState({
    required List<PasswordCategory> passCategories,
  }) : super(passCategories: passCategories);
}

class CategoriesErrorState extends CategoriesState {
  CategoriesErrorState({
    required List<PasswordCategory> passCategories,
    required String error,
  }) : super(passCategories: passCategories, error: error);
}
