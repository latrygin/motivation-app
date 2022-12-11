part of 'pin_code_bloc.dart';

abstract class PinCodeEvent extends Equatable {
  const PinCodeEvent();

  @override
  List<Object> get props => [];
}

class PinCodeChanged extends PinCodeEvent {
  const PinCodeChanged();

  @override
  List<Object> get props => [];
}

class PinCodeSubmitted extends PinCodeEvent {
  const PinCodeSubmitted(this.pinCode);

  final String pinCode;

  @override
  List<Object> get props => [pinCode];
}
