import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pin_code_event.dart';
part 'pin_code_state.dart';

class PinCodeBloc extends Bloc<PinCodeEvent, PinCodeState> {
  PinCodeBloc() : super(const PinCodeState()) {
    on<PinCodeChanged>(_onChangedPinCode);
    on<PinCodeSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onSubmitted(
    PinCodeSubmitted event,
    Emitter<PinCodeState> emit,
  ) {
    debugPrint(event.pinCode);
    emit(state.copyWith(status: PinCodeStatus.incorrect));
  }

  FutureOr<void> _onChangedPinCode(
    PinCodeChanged event,
    Emitter<PinCodeState> emit,
  ) {
    if (state.status == PinCodeStatus.incorrect) {
      emit(
        state.copyWith(
          status: PinCodeStatus.correct,
        ),
      );
    }
  }
}
