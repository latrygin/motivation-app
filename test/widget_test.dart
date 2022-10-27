import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:motivation/screens/auth_pages/login_page/login_page_view_model.dart';

import 'login_test.dart';

void main() async {
  //await Hive.initFlutter();
  //WidgetsFlutterBinding.ensureInitialized();
  //validationTest();
  //loginTest();
  //tokenProviderTest();
}

void validationTest() {
  // test('Тестирование валидации почты на незаполненное поле', (BuildContext context) {
  //   LoginPageViewModel loginViewModel = LoginPageViewModel();

  //   loginViewModel.email.text = '';

  //   bool isValidationEmail = loginViewModel.validateEmail();
  //   expect(isValidationEmail, false);
  // });

  // test('Тестирование валидации почты на короткое поле', () {
  //   LoginPageViewModel loginViewModel = LoginPageViewModel();

  //   loginViewModel.email.text = '123';

  //   bool isValidationEmail = loginViewModel.validateEmail();
  //   expect(isValidationEmail, false);
  // });

  // test('Тестирование валидации почты на правильно заполненное поле', () {
  //   LoginPageViewModel loginViewModel = LoginPageViewModel();

  //   loginViewModel.email.text = 'latrygin@gmail.com';

  //   bool isValidationEmail = loginViewModel.validateEmail();
  //   expect(isValidationEmail, true);
  // });
}
