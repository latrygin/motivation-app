import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/assets/themes/change_theme.dart';
import 'package:provider/provider.dart';

class FrameWidget extends StatelessWidget {
  final bool isSafeArea;
  final Widget? child;
  const FrameWidget({Key? key, this.isSafeArea = true, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, children) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness:
                themeNotifier.isDark ? Brightness.dark : Brightness.light,
            statusBarBrightness:
                themeNotifier.isDark ? Brightness.dark : Brightness.light,
          ),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: child,
                ),
              )));
    });
  }
}
