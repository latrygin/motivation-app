import 'package:flutter/material.dart';

class SVG extends StatelessWidget {
  final Widget? icon;
  final double? size;
  final VoidCallback? onPressed;

  const SVG(this.icon, {super.key, this.size = 38, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return onPressed == null
        ? SizedBox.fromSize(
            size: Size(size ?? 38, size ?? 38),
            child: FittedBox(
              child: SizedBox.fromSize(
                size: Size(size ?? 38, size ?? 38),
                child: icon,
              ),
            ),
          )
        : Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: size ?? 38,
                width: size ?? 38,
                child: FittedBox(
                  child: icon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
  }
}
