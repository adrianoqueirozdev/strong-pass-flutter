import 'package:strong_pass/core/data/models/password.dart';

abstract class PasswordState {
  List<Password> passwords;
  String? error;

  PasswordState({
    required this.passwords,
  });
}

class PasswordInitialState extends PasswordState {
  PasswordInitialState() : super(passwords: []);
}

class PasswordSuccessState extends PasswordState {
  PasswordSuccessState({
    required List<Password> passwords,
  }) : super(passwords: passwords);
}

class PasswordErrorState extends PasswordState {
  PasswordErrorState({
    required List<Password> passwords,
    required String error,
  }) : super(passwords: passwords);
}
