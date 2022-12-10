part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationEmailChanged extends RegistrationEvent {
  const RegistrationEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationEvent {
  const RegistrationPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegistrationNameChanged extends RegistrationEvent {
  const RegistrationNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegistrationObscureChanged extends RegistrationEvent {
  const RegistrationObscureChanged();
}

class RegistrationSubmitted extends RegistrationEvent {
  const RegistrationSubmitted();
}
