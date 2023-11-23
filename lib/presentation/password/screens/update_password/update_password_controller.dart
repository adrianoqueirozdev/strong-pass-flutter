import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/presentation/blocs/password/password_events.dart';
import 'package:strong_pass/shared/mixins/base_password_form.dart';
import 'package:strong_pass/shared/mixins/password_visible.dart';
import 'package:strong_pass/shared/utils/encrypt_data.dart';

class UpdatePasswordController extends GetxController with PasswordVisible, BasePasswordForm {
  final _password = Password().obs;

  Password get password => _password.value;

  void savePass() async {
    if (formKey.currentState!.validate()) {
      password
        ..name = EncryptData.encryptAES(nameController.text)
        ..userId = EncryptData.encryptAES(idUserController.text)
        ..password = EncryptData.encryptAES(passwordController.text);

      passwordBloc.add(UpdatePasswordEvent(password: password));
      Get.back();
    }
  }

  @override
  void onInit() {
    final passwordArgument = Get.arguments as Password;
    _password.value = passwordArgument;
    update();

    nameController.text = passwordArgument.name!;
    idUserController.text = passwordArgument.userId!;
    passwordController.text = passwordArgument.password!;

    super.onInit();
  }
}
