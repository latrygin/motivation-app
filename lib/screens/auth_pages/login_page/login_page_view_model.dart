import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/services/user_services.dart';

class LoginPageViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;
  final BuildContext context;
  String? errorPassword;
  String? errorEmail;
  final _userServicesWithApiFunction = UserServices();

  LoginPageViewModel({required this.context});

  void changeObscureValue() {
    obscure ? obscure = false : obscure = true;
    notifyListeners();
  }

  void onTapButtonLogin(VoidCallback onSuccess) async {
    if (_validateEmail() && _validatePassword()) {
      var statuscode = await _userServicesWithApiFunction.loginUser(
          email.text, password.text);
      if (statuscode == 200) {
        onSuccess.call();
      } else if (statuscode == 401) {
        errorPassword = 'Неправильный логин или пароль';
        notifyListeners();
      } else {
        errorPassword = 'Произошла ошибка';
        notifyListeners();
      }
    } else {
      return;
    }
  }

  bool _validatePassword() {
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

  bool _validateEmail() {
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
