import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_bloc.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_events.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_state.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';

import 'package:strong_pass/shared/mixins/password_visible.dart';

class SignInController extends GetxController with PasswordVisible {
  final GetStorage storage = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  late final AuthBloc authBloc;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();

    if (formKey.currentState!.validate()) {
      authBloc.add(AuthEventLoading());
      authBloc.add(AuthEventSignIn(email: emailController.text, password: passwordController.text));
    }
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  @override
  void onInit() {
    authBloc = AuthBloc();

    authBloc.stream.listen((state) {
      if (state is AuthSuccessState && state.userUid != null) {
        Get.offAllNamed(AppRoutes.home);
      }

      if (state is AuthErrorState) {
        Get.rawSnackbar(
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
          animationDuration: const Duration(milliseconds: 500),
          snackPosition: SnackPosition.TOP,
          message: "Usuário ou senha inválidos",
        );
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    authBloc.close();
    super.onClose();
  }
}
