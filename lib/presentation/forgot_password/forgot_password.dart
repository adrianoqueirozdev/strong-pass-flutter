import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_bloc.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_state.dart';
import 'package:strong_pass/presentation/forgot_password/forgot_password_controller.dart';
import 'package:strong_pass/shared/validations/validate_sign_in.dart';
import 'package:strong_pass/shared/widgets/app_logo.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (controller) {
        return BlocBuilder<AuthBloc, AuthState>(
            bloc: controller.authBloc,
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                    bottom: state.loading
                        ? PreferredSize(
                            preferredSize: const Size.fromHeight(3),
                            child: Container(
                              color: Theme.of(context).colorScheme.surface,
                              height: 3,
                              child: const LinearProgressIndicator(),
                            ),
                          )
                        : null),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 84),
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(child: AppLogo()),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Informe seu email para recuperar sua senha",
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              focusNode: controller.emailFocus,
                              readOnly: state.loading,
                              autofocus: true,
                              controller: controller.emailController,
                              validator: ValidateSignInForm.email,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: state.loading ? null : controller.forgotPassword,
                                child: const Text("Enviar email de recuperação"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
