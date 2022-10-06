import 'dart:async';

import 'package:flutter/material.dart';

class ResetPasswordPageViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();

  String? errorEmail;
  Duration countdown = const Duration(seconds: 1);
  String durationSendMessage = 'Отправить повторно';

  void onTapButtonResetPassword() {
    if (validateEmail()) {}
  }

  void startCountdown() {
    int _start = 10;
    Timer.periodic(countdown, (Timer timer) {
      durationSendMessage = 'Подождите ${_start.toString()} секунд';
      print(_start);
      if (_start == 0) {
        timer.cancel();
        durationSendMessage = 'Отправить повторно';
        notifyListeners();
      } else {
        _start--;
        notifyListeners();
      }
    });
  }

  void sendMessageRepeat() {
    startCountdown();
    notifyListeners();
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

  void resetErrorEmail() {
    errorEmail = null;
    notifyListeners();
  }
}
