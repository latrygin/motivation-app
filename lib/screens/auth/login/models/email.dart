import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  tooShort,
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (value.length < 8) return EmailValidationError.tooShort;
    return null;
  }
}
