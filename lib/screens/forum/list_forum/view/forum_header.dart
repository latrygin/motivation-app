import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:provider/provider.dart';

import '../bloc/list_forum_bloc.dart';

class ForumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ForumAppBar({
    Key? key,
  }) : super(key: key);

  static const double size = 26;
  static const double height = 88;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ListForumBloc>();
    return AppBar(
      elevation: 2,
      title: Text(
        'Форум',
        style:
            Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 24),
      ),
      actions: [
        SVG(
          SVGs(context).unactive_bookmark,
          size: size,
        ),
        const SizedBox(
          width: 20,
        ),
        SVG(
          SVGs(context).unactive_edit1,
          size: size,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      bottom: TabBar(
        onTap: (value) => value == 0
            ? bloc.add(const InitialNewForumEvent())
            : value == 1
                ? bloc.add(const InitialPopularForumEvent())
                : bloc.add(const InitialMyForumEvent()),
        indicatorColor: Theme.of(context).primaryColor,
        splashBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        tabs: <Widget>[
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
          Tab(
            height: 32,
            child: Text(
              'Популярные',
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
