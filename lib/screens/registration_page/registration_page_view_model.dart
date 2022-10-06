import 'package:flutter/cupertino.dart';

class RegistrationPageViewModel extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscure = true;

  String? errorName;
  String? errorEmail;
  String? errorPassword;

  void changeObscureValue() {
    obscure ? obscure = false : obscure = true;
    notifyListeners();
  }

  void onTapButtonRegistration() {
    if (validateName() && validateEmail() && validatePassword()) {
      print(123);
    }
  }

  bool validateName() {
    if (name.text.isEmpty) {
      errorName = 'Поле имени не заполнено';
      notifyListeners();
      return false;
    } else if (name.text.length < 3) {
      errorName = 'Имя пользователя не может быть таким коротким';
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  bool validateEmail() {
    if (email.text.isEmpty) {
      errorEmail = 'Поле почты не заполнено';
      notifyListeners();
      return false;
    } else if (email.text.length < 8) {
      errorEmail = 'Электронная почта не может быть такой короткой';
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword() {
    if (password.text.isEmpty) {
      errorPassword = 'Поле пароля не заполнено';
      notifyListeners();
      return false;
    } else if (password.text.length < 8) {
      errorPassword = 'Пароль слишком короткий';
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  void resetErrorName() {
    errorName = null;
    notifyListeners();
  }

  void resetErrorEmail() {
    errorEmail = null;
    notifyListeners();
  }

  void resetErrorPassword() {
    errorPassword = null;
    notifyListeners();
  }
}
