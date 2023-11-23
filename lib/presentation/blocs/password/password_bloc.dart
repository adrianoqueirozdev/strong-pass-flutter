import 'package:bloc/bloc.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/domain/usecases/password_usecase.dart';
import 'package:strong_pass/presentation/blocs/password/password_events.dart';
import 'package:strong_pass/presentation/blocs/password/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvents, PasswordState> {
  final _passwordUsecase = PasswordUsecase();

  PasswordBloc() : super(PasswordInitialState()) {
    on<LoadPasswordsEvent>((event, emit) async {
      List<Password> passwords = [];

      try {
        passwords = await _passwordUsecase.loadPasswordsByCategory(event.categoryId);
        emit(PasswordSuccessState(passwords: passwords));
      } catch (e) {
        emit(PasswordErrorState(passwords: passwords, error: e.toString()));
      }
    });

    on<CreatePasswordEvent>((event, _) async {
      await _passwordUsecase.createPassword(event.password!);
    });

    on<UpdatePasswordEvent>((event, emit) async {
      await _passwordUsecase.updatePassword(event.password!);
    });

    on<DeletePasswordEvent>((event, emit) async {
      await _passwordUsecase.deletePassword(event.passwordId);

      final currentState = state as PasswordSuccessState;

      final passwords = currentState.passwords.where((password) => password.id != event.passwordId).toList();

      emit(PasswordSuccessState(passwords: passwords));
    });
  }
}
