import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_pass/shared/controllers/generate_password_controller.dart';
import 'package:strong_pass/shared/validations/validate_password_form.dart';
import 'package:strong_pass/shared/widgets/content.dart';

class PasswordForm extends StatelessWidget {
  final String title;
  final String buttonText;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController idUserController;
  final TextEditingController passwordController;
  final bool passwordVisible;
  final VoidCallback togglePasswordVisibility;
  final VoidCallback savePass;

  const PasswordForm({
    super.key,
    required this.title,
    required this.buttonText,
    required this.formKey,
    required this.nameController,
    required this.idUserController,
    required this.passwordController,
    required this.passwordVisible,
    required this.togglePasswordVisibility,
    required this.savePass,
  });

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return GetBuilder<GeneratePasswordController>(
                    init: GeneratePasswordController(),
                    builder: (generatePasswordController) {
                      return AlertDialog(
                        icon: const Icon(
                          Icons.lock_reset,
                          size: 32,
                        ),
                        title: const Text("Gerar senha"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "A senha gerada e:",
                              style: textTheme.titleMedium,
                            ),
                            Chip(
                              backgroundColor: colorScheme.secondaryContainer,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                              label: Text(generatePasswordController.password),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: generatePasswordController.copyPassword,
                            child: const Text("Copiar"),
                          ),
                          TextButton(
                            onPressed: generatePasswordController.generatePassword,
                            child: const Text("Gerar outra"),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            icon: const Icon(Icons.lock_reset),
          ),
        ],
      ),
      body: Content(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  validator: ValidatePasswordForm.validateName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: "Nome",
                    hintText: "Nome",
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: idUserController,
                  validator: ValidatePasswordForm.validateIdUser,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: "Id do usuário",
                    hintText: "Id do usuário",
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  validator: ValidatePasswordForm.validatePassword,
                  obscureText: !passwordVisible,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    labelText: "Senha",
                    hintText: "Senha",
                    suffixIcon: IconButton(
                      onPressed: togglePasswordVisibility,
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: !isKeyboardOpen,
        child: SizedBox(
          width: double.infinity,
          height: 88,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: savePass,
              child: const Text("Salvar"),
            ),
          ),
        ),
      ),
    );
  }
}
