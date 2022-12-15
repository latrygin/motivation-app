import 'package:formz/formz.dart';

enum NameValidationError {
  empty,
  tooShort,
}

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (value.length < 8) return NameValidationError.tooShort;
    return null;
  }
}
