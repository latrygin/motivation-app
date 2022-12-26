import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:motivation/assets/themes/theme_dark.dart';
import 'package:motivation/assets/themes/theme_light.dart';
import 'package:motivation/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'assets/themes/change_theme.dart';
import 'screens/auth/login/login.dart';
import 'screens/auth/pin_code/pin_code.dart';
import 'screens/auth/preloader/preloader.dart';
import 'screens/auth/registration/registration.dart';
import 'screens/auth/reset_password/reset_password.dart';
import 'screens/forum/create_forum/view/create_forum_page.dart';

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
      child: const Secondwidget(),
    );
  }
}

class Secondwidget extends StatelessWidget {
  const Secondwidget({super.key});

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const PreloaderPage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/reset_password',
        builder: (context, state) {
          return const ResetPasswordPage();
        },
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) {
          return const RegistrationPage();
        },
        routes: [
          GoRoute(
            path: 'pincode',
            builder: (context, state) {
              return const PinCodePage();
            },
          )
        ],
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) {
          return const BottomNavigationBarWidget();
        },
        routes: [
          GoRoute(
            path: 'createForum',
            builder: (context, state) {
              return const CreateForumPage();
            },
          )
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, child) {
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
