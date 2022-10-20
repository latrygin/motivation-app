import 'dart:async';

import 'package:flutter/material.dart';

class PinCodePageViewModel extends ChangeNotifier {
  TextEditingController pinCode = TextEditingController();

  Duration countdown = const Duration(seconds: 1);
  String durationSendMessage = 'Отправить повторно';
  int _start = 30;
  late Timer _timer;

  PinCodePageViewModel() {
    startCountdown();
  }

  void checkPinCodeMessage() {
    //
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
}
