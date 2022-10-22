// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motivation/screens/auth_pages/login_page/login_page_view_model.dart';

void main() {
  loginTest();
}

void loginTest() {
  test('Тестирование валидации почты на незаполненное поле', () {
    LoginPageViewModel loginViewModel = LoginPageViewModel();

    loginViewModel.email.text = '';

    bool isValidationEmail = loginViewModel.validateEmail();
    expect(isValidationEmail, false);
  });

  test('Тестирование валидации почты на короткое поле', () {
    LoginPageViewModel loginViewModel = LoginPageViewModel();

    loginViewModel.email.text = '123';

    bool isValidationEmail = loginViewModel.validateEmail();
    expect(isValidationEmail, false);
  });

  test('Тестирование валидации почты на правильно заполненное поле', () {
    LoginPageViewModel loginViewModel = LoginPageViewModel();

    loginViewModel.email.text = 'latrygin@gmail.com';

    bool isValidationEmail = loginViewModel.validateEmail();
    expect(isValidationEmail, true);
  });
}
