import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_bloc.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_state.dart';
import 'package:strong_pass/presentation/sign_in/sign_in_controller.dart';
import 'package:strong_pass/shared/validations/validate_sign_in.dart';
import 'package:strong_pass/shared/widgets/app_logo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return BlocBuilder<AuthBloc, AuthState>(
            bloc: controller.authBloc,
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: state.loading
                      ? PreferredSize(
                          preferredSize: const Size.fromHeight(3),
                          child: Container(
                            color: Theme.of(context).colorScheme.surface,
                            height: 3,
                            child: const LinearProgressIndicator(),
                          ),
                        )
                      : null,
                ),
                body: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 64),
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(child: AppLogo()),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                focusNode: controller.emailFocusNode,
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
                                height: 16,
                              ),
                              TextFormField(
                                focusNode: controller.passwordFocusNode,
                                readOnly: state.loading,
                                controller: controller.passwordController,
                                obscureText: !controller.passwordVisible,
                                keyboardType: TextInputType.number,
                                onEditingComplete: controller.signIn,
                                validator: ValidateSignInForm.password,
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  prefixIcon: const Icon(Icons.lock_rounded),
                                  suffixIcon: IconButton(
                                    onPressed: controller.togglePasswordVisibility,
                                    icon: Icon(
                                      controller.passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: controller.navigateToForgotPassword,
                                  child: const Text(
                                    "Esqueceu a senha?",
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: state.loading ? null : controller.signIn,
                                  child: const Text("Entrar"),
                                ),
                              )
                            ],
                          ),
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
