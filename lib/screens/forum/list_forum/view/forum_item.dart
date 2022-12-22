import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/domain/entity/forum/forum.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ForumItemWidget extends StatefulWidget {
  final Forum forum;
  const ForumItemWidget({
    Key? key,
    required this.forum,
  }) : super(key: key);

  @override
  State<ForumItemWidget> createState() => _ForumItemWidgetState();
}

class _ForumItemWidgetState extends State<ForumItemWidget> {
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
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      child: InkWell(
        splashColor: Theme.of(context).hintColor.withOpacity(0.5),
        highlightColor: Theme.of(context).hintColor.withOpacity(0.5),
        onTap: () => debugPrint('material'),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
            top: 8,
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
                          widget.forum.theme,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        differenceDateTime(widget.forum.created_at),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  PopupMenuButton<SampleItem>(
                    icon: SVG(
                      SVGs(context).more,
                      size: 24,
                    ),
                    tooltip: 'Меню',
                    splashRadius: 24,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    onSelected: (item) {
                      debugPrint(item.toString());
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Text('Добавить в избранное'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Text('Читать позже'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: Text('Отправить'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: Text('Пожаловаться'),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.forum.title,
                maxLines: 2,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.forum.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (widget.forum.image == null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                  child: Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.photo,
                      size: 58,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      widget.forum.image!,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.photo,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SVG(
                        SVGs(context).unactive_message,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.forum.count_message.toString(),
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
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.forum.count_view.toString(),
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
                        size: 40,
                        onPressed: () => debugPrint('Yf123'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        (widget.forum.count_up - widget.forum.count_down)
                            .toString(),
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 14,
                                  color: widget.forum.count_up -
                                              widget.forum.count_down >=
                                          0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SVG(
                        SVGs(context).chevron_up,
                        size: 40,
                        onPressed: () => debugPrint('Yf123'),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
