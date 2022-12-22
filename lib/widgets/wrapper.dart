// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/assets/themes/change_theme.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final bool bottom;
  final EdgeInsets padding;
  final Color? safeAreaColor;
  final Color? backgroundColor;
  final BottomNavigationBar? bottomNavigationBar;
  const Wrapper({
    Key? key,
    required this.child,
    this.appBar,
    this.bottom = true,
    this.padding = const EdgeInsets.all(0),
    this.safeAreaColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, children) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarBrightness: Theme.of(context).brightness,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
            body: Container(
              color: safeAreaColor,
              child: SafeArea(
                bottom: bottom,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: backgroundColor == Colors.transparent
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).hintColor,
                  padding: padding,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
