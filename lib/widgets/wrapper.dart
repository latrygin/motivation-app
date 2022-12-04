import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/assets/themes/change_theme.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final bool bottom;
  final EdgeInsets padding;
  const Wrapper(
      {Key? key,
      required this.child,
      required this.appBar,
      this.bottom = true,
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, children) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarBrightness: Theme.of(context).brightness,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: SafeArea(
              bottom: bottom,
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ));
    });
  }
}
