// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/services/user_services.dart';

class PreloaderPageViewModel extends ChangeNotifier {
  final _checkAuthrizationUser = UserServices();
  final BuildContext context;
  PreloaderPageViewModel({required this.context}) {
    autoAuthrization(context);
  }

  autoAuthrization(BuildContext context) async {
    var userIsAuth = await _checkAuthrizationUser.autoLogin();
    if (userIsAuth == true) {
      context.go('/main');
    } else {
      context.go('/login');
    }
  }
}
