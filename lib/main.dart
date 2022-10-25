import 'package:flutter/material.dart';
import 'package:motivation/assets/themes/theme_dark.dart';
import 'package:motivation/assets/themes/theme_light.dart';
import 'package:motivation/domain/services/user_services.dart';
import 'package:motivation/screens/auth_pages/login_page/login_page.dart';
import 'package:motivation/screens/auth_pages/pin_code_page/pin_code_page.dart';
import 'package:motivation/screens/auth_pages/preloader_page.dart/preloader_page.dart';
import 'package:motivation/screens/auth_pages/registration_page/registration_page.dart';
import 'package:motivation/screens/auth_pages/reset_password_page/reset_password_page.dart';
import 'package:motivation/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'assets/themes/change_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
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
          //return const ForumScreen();
          return const PreloaderScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          //return const BottomNavigationBarWidget();
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/reset_password',
        builder: (context, state) {
          return const ResetPasswordScreen();
        },
      ),
      GoRoute(
          path: '/registration',
          builder: (BuildContext context, GoRouterState state) {
            return const RegistrationScreen();
          },
          routes: [
            GoRoute(
              path: 'pincode',
              builder: (context, state) {
                return const PinCodeScreen();
              },
            )
          ]),
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavigationBarWidget();
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
