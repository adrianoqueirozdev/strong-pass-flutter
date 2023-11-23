import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_events.dart';
import 'package:strong_pass/presentation/blocs/password/password_events.dart';
import 'package:strong_pass/shared/mixins/base_password_form.dart';
import 'package:strong_pass/shared/mixins/password_visible.dart';
import 'package:strong_pass/shared/utils/encrypt_data.dart';

class PasswordCreateController extends GetxController with PasswordVisible, BasePasswordForm {
  void savePass() async {
    if (formKey.currentState!.validate()) {
      final passCategory = Get.arguments as PasswordCategory;
      final name = nameController.text;

      final password = Password()
        ..currentUser = FirebaseAuth.instance.currentUser!.uid
        ..name = EncryptData.encryptAES(name)
        ..userId = EncryptData.encryptAES(idUserController.text)
        ..password = EncryptData.encryptAES(passwordController.text)
        ..passwordCategoryId = passCategory.id
        ..createdAt = DateTime.now().toIso8601String();

      passwordBloc.add(CreatePasswordEvent(password: password));
      categoriesBloc.add(IncrementCategoryCountPasswords(categoryId: passCategory.id!));
      Get.back();
    }
  }
}
