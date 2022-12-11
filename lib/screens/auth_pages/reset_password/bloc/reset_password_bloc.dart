import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/auth_pages/reset_password/reset_password.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState()) {
    on<ResetPasswordCounter>(_startCounter);
    on<ResetPasswordOnButton>(_onTapButton);
    on<ResetPasswordEmailChanged>(_onEmailChanged);
  }

  void _startCounter(
    ResetPasswordCounter event,
    Emitter<ResetPasswordState> emit,
  ) {
    // if (state.timerStatus == TimerStatus.end) {
    //   emit(state.copyWith(timerStatus: TimerStatus.start));
    // } else {
    //   debugPrint('Выход');
    //   return;
    // }
  }

  FutureOr<void> _onTapButton(
    ResetPasswordOnButton event,
    Emitter<ResetPasswordState> emit,
  ) {
    if (state.email.validator(state.email.value) == null) {
      //some code..
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
    }
  }

  void _onEmailChanged(
    ResetPasswordEmailChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        errorEmail: 'null',
      ),
    );
  }
}
