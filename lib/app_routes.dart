import 'package:flutter/material.dart';
import 'package:strong_pass/presentation/forgot_password/forgot_password.dart';
import 'package:strong_pass/presentation/home/home_screen.dart';
import 'package:strong_pass/presentation/password/screen/password_screen.dart';
import 'package:strong_pass/presentation/password/screens/password_create/password_create_screen.dart';
import 'package:strong_pass/presentation/password/screens/update_password/update_password_screen.dart';
import 'package:strong_pass/presentation/sign_in/sign_in_screen.dart';
import 'package:strong_pass/presentation/splash/splash_screen.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';

Map<String, Widget Function(BuildContext context)> getRoutes() {
  return {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.signIn: (context) => const SignInScreen(),
    AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.password: (context) => const PasswordScreen(),
    AppRoutes.passwordCreate: (context) => const PasswordCreateScreen(),
    AppRoutes.updatePassword: (context) => const UpdatePasswordScreen(),
  };
}
