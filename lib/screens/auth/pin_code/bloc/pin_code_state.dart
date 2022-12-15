// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pin_code_bloc.dart';

class PinCodeState extends Equatable {
  final String pinCode;
  final PinCodeStatus status;

  const PinCodeState({
    this.pinCode = '',
    this.status = PinCodeStatus.correct,
  });

  PinCodeState copyWith({
    String? pinCode,
    PinCodeStatus? status,
  }) {
    return PinCodeState(
      pinCode: pinCode ?? this.pinCode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [pinCode, status];
}

enum PinCodeStatus { correct, incorrect }
