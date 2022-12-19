import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/assets/themes/change_theme.dart';
import 'package:provider/provider.dart';

class ChangingThemeButtonWidget extends StatelessWidget {
  const ChangingThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, child) {
        return SVG(
          SVGs(context).theme,
          onPressed: () {
            themeNotifier.isDark
                ? themeNotifier.isDark = false
                : themeNotifier.isDark = true;
          },
          size: 36,
        );
      },
    );
  }
}
