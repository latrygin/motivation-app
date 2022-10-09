import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const HeaderWidget({Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 24),
          ),
          Row(
            children: children,
          )
        ],
      ),
    );
  }
}
