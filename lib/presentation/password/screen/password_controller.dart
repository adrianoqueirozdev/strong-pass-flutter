import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/presentation/blocs/password/password_bloc.dart';
import 'package:strong_pass/presentation/blocs/password/password_events.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';
import 'package:strong_pass/shared/controllers/base_controller.dart';

class PasswordController extends BaseController<Password> {
  final _passCategory = PasswordCategory().obs;

  late final PasswordBloc passwordBloc;

  PasswordCategory get passCategory => _passCategory.value;

  void navigateToPassCreate() {
    Get.toNamed(AppRoutes.passwordCreate, arguments: passCategory)?.then((_) => _loadPassesByCategory());
  }

  void _loadPassesByCategory() {
    passwordBloc.add(LoadPasswordsEvent(categoryId: passCategory.id!));
  }

  void editPassword(Password password) {
    Get.back();
    Get.toNamed(AppRoutes.updatePassword, arguments: password)?.then((_) => _loadPassesByCategory());
  }

  void deletePassword(String id) {
    passwordBloc.add(DeletePasswordEvent(passwordId: id));
    Get.back();
  }

  @override
  void onInit() {
    _passCategory.value = Get.arguments as PasswordCategory;

    passwordBloc = PasswordBloc();
    _loadPassesByCategory();

    super.onInit();
  }

  @override
  void onClose() {
    passwordBloc.close();
    super.onClose();
  }
}
