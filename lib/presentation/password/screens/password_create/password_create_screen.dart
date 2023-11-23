import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/password/screens/password_create/password_create_controller.dart';
import 'package:strong_pass/presentation/password/widgets/password_form.dart';

class PasswordCreateScreen extends StatelessWidget {
  const PasswordCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordCreateController>(
      init: PasswordCreateController(),
      builder: (controller) {
        return PasswordForm(
          title: "Nova entrada",
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
