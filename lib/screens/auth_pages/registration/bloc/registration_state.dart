part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.obscureText = true,
    this.errorName = 'null',
    this.errorEmail = 'null',
    this.errorPassword = 'null',
  });

  final FormzStatus status;
  final Name name;
  final Email email;
  final Password password;
  final bool obscureText;
  final String errorName;
  final String errorEmail;
  final String errorPassword;

  RegistrationState copyWith({
    FormzStatus? status,
    Name? name,
    Email? email,
    Password? password,
    bool? obscureText,
    String? errorName,
    String? errorEmail,
    String? errorPassword,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      errorName: errorName ?? this.errorName,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        email,
        password,
        obscureText,
        errorName,
        errorEmail,
        errorPassword
      ];

  @override
  bool get stringify => true;
}
