import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_bloc.dart';
import 'package:strong_pass/presentation/blocs/password/password_bloc.dart';

mixin BasePasswordForm on GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idUserController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final PasswordBloc passwordBloc;
  late final CategoriesBloc categoriesBloc;

  @override
  void onInit() {
    passwordBloc = PasswordBloc();
    categoriesBloc = CategoriesBloc();
    super.onInit();
  }

  @override
  void onClose() {
    passwordBloc.close();
    categoriesBloc.close();
    super.onClose();
  }
}
