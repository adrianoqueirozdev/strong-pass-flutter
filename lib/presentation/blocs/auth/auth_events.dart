abstract class AuthEvents {
  String? email;

  AuthEvents({this.email});
}

class AuthEventLoading extends AuthEvents {}

class AuthEventSignIn extends AuthEvents {
  String password;

  AuthEventSignIn({
    required String email,
    required this.password,
  }) : super(email: email);
}

class AuthEventForgotPasswordLoading extends AuthEvents {}

class AuthEventForgotPassword extends AuthEvents {
  AuthEventForgotPassword({required String email}) : super(email: email);
}
