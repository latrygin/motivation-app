import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../models/models.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginObscureChanged>(_onObscureChanged);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        errorEmail: 'null',
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        errorPassword: 'null',
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.email.validator(state.email.value) == null &&
        state.password.validator(state.password.value) == null) {
      // some code ..

    } else {
      switch (state.email.validator(state.email.value)) {
        case EmailValidationError.empty:
          emit(state.copyWith(errorEmail: 'Пустое поле'));
          break;
        case EmailValidationError.tooShort:
          emit(state.copyWith(errorEmail: 'Поле слишком короткое'));
          break;
        default:
          break;
      }
      switch (state.password.validator(state.password.value)) {
        case PasswordValidationError.empty:
          emit(state.copyWith(errorPassword: 'Пустое поле'));
          break;
        case PasswordValidationError.tooShort:
          emit(
            state.copyWith(
              errorPassword: 'Поле слишком короткое',
            ),
          );
          break;
        default:
          break;
      }
    }
  }

  void _onObscureChanged(
    LoginObscureChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }
}
