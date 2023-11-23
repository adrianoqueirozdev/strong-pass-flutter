import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/password/screens/update_password/update_password_controller.dart';
import 'package:strong_pass/presentation/password/widgets/password_form.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePasswordController>(
      init: UpdatePasswordController(),
      builder: (controller) {
        return PasswordForm(
          title: "Editar entrada",
          buttonText: "Salvar",
          formKey: controller.formKey,
          nameController: controller.nameController,
          idUserController: controller.idUserController,
          passwordController: controller.passwordController,
          passwordVisible: controller.passwordVisible,
          togglePasswordVisibility: controller.togglePasswordVisibility,
          savePass: controller.savePass,
        );
      },
    );
  }
}
