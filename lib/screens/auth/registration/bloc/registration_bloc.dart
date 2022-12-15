import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../registration.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<RegistrationNameChanged>(_onNameChanged);
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationSubmitted>(_onSubmitted);
    on<RegistrationObscureChanged>(_onObscureChanged);
  }

  void _onNameChanged(
    RegistrationNameChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        errorName: 'null',
      ),
    );
  }

  void _onEmailChanged(
    RegistrationEmailChanged event,
    Emitter<RegistrationState> emit,
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
    RegistrationPasswordChanged event,
    Emitter<RegistrationState> emit,
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
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.email.validator(state.email.value) == null &&
        state.password.validator(state.password.value) == null &&
        state.name.validator(state.name.value) == null) {
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
      switch (state.name.validator(state.name.value)) {
        case NameValidationError.empty:
          emit(state.copyWith(errorName: 'Пустое поле'));
          break;
        case NameValidationError.tooShort:
          emit(
            state.copyWith(
              errorName: 'Поле слишком короткое',
            ),
          );
          break;
        default:
          break;
      }
    }
  }

  void _onObscureChanged(
    RegistrationObscureChanged event,
    Emitter<RegistrationState> emit,
  ) =>
      emit(state.copyWith(obscureText: !state.obscureText));
}
