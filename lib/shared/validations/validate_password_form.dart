class ValidatePasswordForm {
  ValidatePasswordForm._();

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    return null;
  }

  static String? validateIdUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'Id do usuário é obrigatório';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 6) {
      return 'Senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }
}
