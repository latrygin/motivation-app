import 'package:flutter/material.dart';
import 'package:motivation/assets/themes/theme_dark.dart';
import 'package:motivation/assets/themes/theme_light.dart';
import 'package:motivation/screens/registration_page/registration_page.dart';
import 'package:provider/provider.dart';
import 'assets/themes/change_theme.dart';
import 'screens/login_page/login_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Secondwidget(),
    );
  }
}

class Secondwidget extends StatelessWidget {
  Secondwidget({super.key});

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/registration',
        builder: (BuildContext context, GoRouterState state) {
          return const RegistrationScreen();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp.router(
          title: 'Motivation',
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDark ? darkTheme : lightTheme,
          routerConfig: _router,
        );
      },
    );
  }
}
