// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.obscureText = true,
    this.errorEmail = 'null',
    this.errorPassword = 'null',
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final bool obscureText;
  final String errorEmail;
  final String errorPassword;

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    bool? obscureText,
    String? errorEmail,
    String? errorPassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
    );
  }

  @override
  List<Object> get props =>
      [status, email, password, obscureText, errorEmail, errorPassword];

  @override
  bool get stringify => true;
}
