// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  final Email email;
  final int counter;
  final String errorEmail;
  final TimerStatus timerStatus;

  const ResetPasswordState({
    this.email = const Email.pure(),
    this.counter = 30,
    this.errorEmail = 'null',
    this.timerStatus = TimerStatus.end,
  });

  ResetPasswordState copyWith({
    Email? email,
    int? counter,
    String? errorEmail,
    TimerStatus? timerStatus,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      counter: counter ?? this.counter,
      errorEmail: errorEmail ?? this.errorEmail,
      timerStatus: timerStatus ?? this.timerStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        counter,
        errorEmail,
        timerStatus,
      ];

  @override
  bool get stringify => true;
}

enum TimerStatus { start, end }
