import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';

import '../chat.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    Key? key,
  }) : super(key: key);

  static const double size = 26;
  static const double height = 88;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) =>
          previous.isSelectMode != current.isSelectMode,
      builder: (context, state) {
        return state.isSelectMode
            ? AppBar(
                elevation: 2,
                title: Row(
                  children: [
                    GestureDetector(
                      child: SVG(
                        SVGs(context).close,
                        size: size,
                        //onPressed: () => model.deletedListItems(),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      state.selectedChats!.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 20),
                    )
                  ],
                ),
                actions: [
                  SVG(
                    SVGs(context).trash,
                    size: size,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SVG(
                    SVGs(context).volume_cross,
                    size: size,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  SVG(
                    SVGs(context).volume_high,
                    size: size,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  splashBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  tabs: <Widget>[
                    Tab(
                      height: 32,
                      child: Text(
                        'Друзья',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      height: 32,
                      child: Text(
                        'Группы',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      height: 32,
                      child: Text(
                        'Мои',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              )
            : AppBar(
                elevation: 2,
                title: Text(
                  'Сообщения',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 24),
                ),
                actions: [
                  SVG(
                    SVGs(context).more,
                    size: size,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  splashBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  tabs: <Widget>[
                    Tab(
                      height: 32,
                      child: Text(
                        'Друзья',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      height: 32,
                      child: Text(
                        'Группы',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      height: 32,
                      child: Text(
                        'Новые',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
