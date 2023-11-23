abstract class AuthState {
  String? userUid;
  bool loading;
  String? error;

  AuthState({this.userUid, this.loading = false, this.error});
}

class AuthInitialState extends AuthState {
  AuthInitialState() : super(userUid: null);
}

class AuthLoadingState extends AuthState {
  AuthLoadingState({required bool loading}) : super(userUid: null, loading: loading);
}

class AuthSuccessState extends AuthState {
  AuthSuccessState({
    required String? userUid,
    required bool loading,
  }) : super(userUid: userUid, loading: loading);
}

class AuthErrorState extends AuthState {
  AuthErrorState({
    String? userUid,
    required String error,
  }) : super(userUid: userUid, error: error);
}

class AuthSuccessForgotPasswordLoadingState extends AuthState {
  AuthSuccessForgotPasswordLoadingState({required bool loading}) : super(loading: loading);
}

class AuthSuccessForgotPasswordState extends AuthState {
  AuthSuccessForgotPasswordState({required bool loading}) : super(loading: loading);
}

class AuthErrorForgotPasswordState extends AuthState {
  AuthErrorForgotPasswordState({required String error}) : super(error: error);
}
