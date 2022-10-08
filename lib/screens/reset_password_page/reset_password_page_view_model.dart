import 'dart:async';

import 'package:flutter/material.dart';

class ResetPasswordPageViewModel extends ChangeNotifier {
  TextEditingController email = TextEditingController();

  String? errorEmail;
  Duration countdown = const Duration(seconds: 1);
  String durationSendMessage = 'Отправить повторно';
  int _start = 30;
  late Timer _timer;

  ResetPasswordPageViewModel() {
    startCountdown();
  }

  void onTapButtonResetPassword() {
    if (validateEmail()) {}
  }

  void startCountdown() {
    if (_start == 30) {
      _timer = Timer.periodic(countdown, (Timer timer) {
        durationSendMessage = 'Подождите ${_start.toString()} секунд';
        if (_start == 0) {
          timer.cancel();
          durationSendMessage = 'Отправить повторно';
          _start = 30;
        } else {
          _start--;
        }
        notifyListeners();
      });
    } else {
      return;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
