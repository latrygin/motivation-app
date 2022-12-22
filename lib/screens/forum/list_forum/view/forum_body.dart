import 'package:flutter/material.dart';
import 'forum_header.dart';
import 'forum_my_list.dart';
import 'forum_new_list.dart';
import 'forum_popular_list.dart';

class ListForumBody extends StatelessWidget {
  const ListForumBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).hintColor,
        appBar: const ForumAppBar(),
        body: const TabBarView(
          children: <Widget>[
            ListNewForumWidget(),
            ListPopularForumWidget(),
            ListMyForumWidget(),
          ],
        ),
        // floatingActionButton: model.isShowFloatingActionButton
        //     ? FloatingActionButton(
        //         backgroundColor: Theme.of(context).primaryColor,
        //         onPressed: () => model.scrollUpOnTapFloatingActionButton(),
        //         tooltip: 'Подняться наверх',
        //         child: const Icon(
        //           CupertinoIcons.chevron_up,
        //           size: 18,
        //         ),
        //       )
        //     : const SizedBox(),
      ),
    );
  }
}
