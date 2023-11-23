import 'package:strong_pass/core/data/models/password.dart';

abstract class PasswordEvents {
  Password? password;

  PasswordEvents({
    this.password,
  });
}

class LoadPasswordsEvent extends PasswordEvents {
  String categoryId;

  LoadPasswordsEvent({required this.categoryId});
}

class CreatePasswordEvent extends PasswordEvents {
  CreatePasswordEvent({Password? password}) : super(password: password);
}

class UpdatePasswordEvent extends PasswordEvents {
  UpdatePasswordEvent({Password? password}) : super(password: password);
}

class DeletePasswordEvent extends PasswordEvents {
  String passwordId;

  DeletePasswordEvent({required this.passwordId});
}
