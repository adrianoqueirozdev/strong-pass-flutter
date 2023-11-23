import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_bloc.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_events.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;

  void navigateToPass(PasswordCategory passCategory) {
    Get.toNamed(AppRoutes.password, arguments: passCategory)?.then((_) {
      categoriesBloc.add(LoadCategoriesEvent());
    });
  }

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();

    categoriesBloc.add(LoadCategoriesEvent());

    super.onInit();
  }

  @override
  void onClose() {
    categoriesBloc.close();
    super.onClose();
  }
}
