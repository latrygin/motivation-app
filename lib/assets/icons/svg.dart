import 'package:flutter/material.dart';

class SVG extends StatelessWidget {
  final Widget? icon;
  final double? size;
  final VoidCallback? onPressed;

  const SVG(this.icon, {super.key, this.size = 24, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size ?? 24),
      child: SizedBox(
        height: size,
        width: size,
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}
