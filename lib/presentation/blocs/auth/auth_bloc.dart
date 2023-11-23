import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strong_pass/core/domain/usecases/auth_usecase.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_events.dart';
import 'package:strong_pass/presentation/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthUsecase _authUsecase = AuthUsecase();

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEventLoading>((event, emit) => emit(AuthLoadingState(loading: true)));

    on<AuthEventSignIn>(
      (event, emit) async {
        try {
          final userUid = await _authUsecase.signInWithEmailAndPassword(event.email!, event.password);
          emit(AuthSuccessState(userUid: userUid, loading: false));
        } catch (e) {
          emit(AuthErrorState(userUid: null, error: e.toString()));
        }
      },
    );

    on<AuthEventForgotPasswordLoading>((event, emit) => emit(AuthSuccessForgotPasswordLoadingState(loading: true)));

    on<AuthEventForgotPassword>((event, emit) async {
      try {
        await _authUsecase.forgotPassword(event.email!);
        emit(AuthSuccessForgotPasswordState(loading: false));
      } catch (e) {
        emit(AuthErrorForgotPasswordState(error: e.toString()));
      }
    });
  }
}
