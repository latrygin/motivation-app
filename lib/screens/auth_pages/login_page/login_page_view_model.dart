import 'package:flutter/material.dart';

class LoginPageViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscure = true;

  String? errorPassword;
  String? errorEmail;

  void changeObscureValue() {
    obscure ? obscure = false : obscure = true;
    notifyListeners();
  }

  void onTapButtonLogin() {
    if (validateEmail() && validatePassword()) {}
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

  void resetErrorPassword() {
    errorPassword = null;
    notifyListeners();
  }

  void resetErrorEmail() {
    errorEmail = null;
    notifyListeners();
  }
}
