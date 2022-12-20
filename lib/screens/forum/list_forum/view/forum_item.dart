import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/domain/entity/forum/forum.dart';

class ForumItemWidget extends StatelessWidget {
  final Forum forum;
  const ForumItemWidget({Key? key, required this.forum}) : super(key: key);

  void getDialogWindow(BuildContext context, TapDownDetails details) {
    showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 28,
                top: details.globalPosition.dy - 50,
              ),
              child: Container(
                height: 50,
                width: 160,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: SVG(SVGs(context).close),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: SVG(SVGs(context).saved),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: SVG(SVGs(context).send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String differenceDateTime(DateTime time) {
    final now = DateTime.now();
    final dif = now.difference(time);
    if (dif.inMinutes < 60) {
      return '${dif.inMinutes}м';
    } else if (dif.inHours < 24) {
      return '${dif.inHours}ч';
    } else {
      return '${dif.inDays}д';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        //color: Theme.of(context).hintColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      forum.theme,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    differenceDateTime(forum.created_at),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              GestureDetector(
                onTapDown: (details) => getDialogWindow(context, details),
                child: SVG(
                  SVGs(context).more,
                  onPressed: () {},
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            forum.title,
            maxLines: 2,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            forum.description!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SVG(
                    SVGs(context).unactive_message,
                    onPressed: () {},
                    size: 22,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    forum.count_message.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SVG(
                    SVGs(context).unactive_eye,
                    onPressed: () {},
                    size: 22,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    forum.count_view.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  SVG(
                    SVGs(context).chevron_down,
                    size: 32,
                  ),
                  // const Icon(
                  //   CupertinoIcons.chevron_down,
                  //   size: 20,
                  // ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    (forum.count_up - forum.count_down).toString(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 14,
                          color: forum.count_up - forum.count_down >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SVG(
                    SVGs(context).chevron_up,
                    size: 32,
                  ),
                  // const Icon(
                  //   CupertinoIcons.chevron_up,
                  //   size: 20,
                  // ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
