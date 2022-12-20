import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final Color colorsTitle;
  final Color color;
  final String title;
  final String description;
  final bool isWorking;
  const CardItemWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.colorsTitle,
    this.isWorking = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 20 * 3) / 2,
      width: (MediaQuery.of(context).size.width - 20 * 3) / 2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        height: 1,
                        color: colorsTitle,
                      ),
                ),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: colorsTitle),
                ),
              ],
            ),
          ),
          if (isWorking)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.warning_rounded,
                  color: Colors.amber,
                  size: 32,
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
