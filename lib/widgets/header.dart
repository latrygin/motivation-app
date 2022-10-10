import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final List<Widget> children;
  final bool isShadow;
  const HeaderWidget(
      {Key? key,
      this.title,
      required this.children,
      required this.isShadow,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      color: Colors.transparent,
      height: 68,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: isShadow
                ? [
                    BoxShadow(
                        color: Theme.of(context).hintColor,
                        offset: const Offset(0, 2),
                        blurRadius: 1)
                  ]
                : null),
        padding:
            const EdgeInsets.only(top: 20.0, bottom: 18.0, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title != null
                ? Text(
                    title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 24),
                  )
                : Row(
                    children: actions ?? [],
                  ),
            Row(
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
