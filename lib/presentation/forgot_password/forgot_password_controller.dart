import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_bloc.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_events.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_state.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final AuthBloc authBloc;

  void forgotPassword() {
    emailFocus.unfocus();

    if (formKey.currentState!.validate()) {
      authBloc.add(AuthEventForgotPasswordLoading());
      authBloc.add(AuthEventForgotPassword(email: emailController.text));
      Get.back();
    }
  }

  @override
  void onInit() {
    authBloc = AuthBloc();

    authBloc.stream.listen((event) {
      if (event is AuthSuccessForgotPasswordState) {
        Get.rawSnackbar(
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
          animationDuration: const Duration(milliseconds: 500),
          snackPosition: SnackPosition.TOP,
          message: "Email enviado com sucesso",
        );
      }
    });

    super.onInit();
  }
}
