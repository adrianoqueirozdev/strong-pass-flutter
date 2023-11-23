import 'package:get/get.dart';

class ValidateSignInForm {
  ValidateSignInForm._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!GetUtils.isEmail(value)) {
      return 'E-mail inválido';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe sua senha';
    }

    if (value.length < 6) {
      return 'Mínimo 6 caracteres';
    }

    return null;
  }
}
