import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/services/user_services.dart';

class LoginPageViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;
  bool isActiveButton = true;
  String? errorPassword;
  String? errorEmail;
  final _userServicesWithApiFunction = UserServices();

  void changeObscureValue() {
    obscure ? obscure = false : obscure = true;
    notifyListeners();
  }

  ///Меняет состояние кнопки, если true - кнопка активна,
  ///иначе выводится виджет загрузки и метод onTapButtonLogin
  ///не работает
  void _changeFocusButton() {
    isActiveButton ? isActiveButton = false : isActiveButton = true;
    notifyListeners();
  }

  ///Метод по нажатию на кнопку "Войти"
  ///Валидируются поля и проверяется, активна ли кнопка
  void onTapButtonLogin(BuildContext context, bool mounted) async {
    if (_validateEmail() && _validatePassword() && isActiveButton) {
      _changeFocusButton();
      var statuscode = await _userServicesWithApiFunction.loginUser(
          email.text, password.text);
      if (statuscode == 200) {
        if (!mounted) return;
        context.go('/main');
      } else if (statuscode == 401) {
        errorPassword = 'Неправильный логин или пароль';
      } else {
        errorPassword = 'Произошла ошибка';
      }
      _changeFocusButton();
    } else {
      return;
    }
  }

  ///Простой метод валидации пароля
  ///пользователя при выполнении входа,
  ///чтобы избежать лишнюю отправку запроса
  ///на сервер
  bool _validatePassword() {
    if (password.text.isEmpty) {
      //Если поле виджета TextFormField пустое
      errorPassword = 'Поле пароля не заполнено';
      notifyListeners();
      return false;
    } else if (password.text.length < 8) {
      //Если поле виджета TextFormField меньше 8
      errorPassword = 'Пароль слишком короткий';
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  ///Простой метод валидации почты
  ///пользователя при выполнении входа,
  ///чтобы избежать лишнюю отправку запроса
  ///на сервер
  bool _validateEmail() {
    if (email.text.isEmpty) {
      //Если поле виджета TextFormField пустое
      errorEmail = 'Поле почты не заполнено';
      notifyListeners();
      return false;
    } else if (email.text.length < 8) {
      //Если поле виджета TextFormField меньше 8
      errorEmail = 'Электронная почта не может быть такой короткой';
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  ///Сброс ошибки связанной с паролем
  ///при вводе новых данных в TextField,
  ///Функция работате в методе
  ///```dart
  ///TextFormField(
  ///   onChanged:() => resetErrorPassword()
  ///)
  ///```
  void resetErrorPassword() {
    errorPassword = null;
    notifyListeners();
  }

  ///Сброс ошибки связанной с почтой
  ///при вводе новых данных в TextField,
  ///Функция работате в методе
  ///```dart
  ///TextFormField(
  ///   onChanged:() => resetErrorEmail()
  ///)
  ///```
  void resetErrorEmail() {
    errorEmail = null;
    notifyListeners();
  }
}
