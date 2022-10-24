import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/services/user_services.dart';

class RegistrationPageViewModel extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscure = true;
  bool isActiveButton = true;

  String? errorName;
  String? errorEmail;
  String? errorPassword;

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

  ///Метод по нажатию на кнопку "Зарегистрироваться"
  ///Валидируются поля и проверяется, активна ли кнопка
  void onTapButtonRegistration(BuildContext context, bool mounted) async {
    if (validateName() &&
        _validateEmail() &&
        _validatePassword() &&
        isActiveButton) {
      _changeFocusButton();
      var statusCode = await _userServicesWithApiFunction.registrationUser(
          name.text, email.text, password.text, password.text);
      if (statusCode == 201) {
        if (!mounted) return;
        context.go('/login');
      } else if (statusCode == 422) {
        errorEmail = 'Пользователь с такой почтой уже существует';
      } else {
        errorPassword = 'Произошла ошибка';
      }
      _changeFocusButton();
    }
  }

  ///Простой метод валидации имени
  ///пользователя при выполнении входа,
  ///чтобы избежать лишнюю отправку запроса
  ///на сервер
  bool validateName() {
    if (name.text.isEmpty) {
      //Если поле виджета TextFormField пустое
      errorName = 'Поле имени не заполнено';
      notifyListeners();
      return false;
    } else if (name.text.length < 3) {
      //Если поле виджета TextFormField меньше 8
      errorName = 'Имя пользователя не может быть таким коротким';
      notifyListeners();
      return false;
    } else {
      return true;
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

  ///Сброс ошибки связанной с Именем
  ///при вводе новых данных в TextField,
  ///Функция работате в методе
  ///```dart
  ///TextFormField(
  ///   onChanged:() => resetErrorPassword()
  ///)
  ///```
  void resetErrorName() {
    errorName = null;
    notifyListeners();
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
