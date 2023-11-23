import 'package:bloc/bloc.dart';
import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/core/domain/usecases/password_categories_usecase.dart';
import 'package:strong_pass/core/domain/usecases/password_usecase.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_events.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final _passwordCategoriesUsecase = PassCategoriesUsecase();
  final _passwordUsecase = PasswordUsecase();

  CategoriesBloc() : super(CategoriesInitialState()) {
    on<LoadCategoriesEvent>(
      (event, emit) async {
        List<PasswordCategory> passCategories = [];

        try {
          passCategories = await _passwordCategoriesUsecase.loadCategories();

          // load total passwords for each category
          for (var element in passCategories) {
            final passwords = await _passwordUsecase.loadPasswordsByCategory(element.id!);
            element.totalPasswords = passwords.length;
          }

          // sort by total passwords
          passCategories.sort((a, b) => b.totalPasswords!.compareTo(a.totalPasswords!));

          emit(CategoriesSuccessState(passCategories: passCategories));
        } catch (e) {
          emit(CategoriesErrorState(passCategories: passCategories, error: e.toString()));
        }
      },
    );

    on<IncrementCategoryCountPasswords>((event, emit) async {
      await _passwordCategoriesUsecase.incrementCategoryCountPasswords(event.categoryId);
    });
  }
}
