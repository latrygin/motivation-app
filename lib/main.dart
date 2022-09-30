import 'package:flutter/material.dart';
import 'package:motivation/assets/themes/theme_dark.dart';
import 'package:motivation/assets/themes/theme_light.dart';

import 'screens/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivation',
      theme: darkTheme,
      home: const LoginScreen(),
    );
  }
}
