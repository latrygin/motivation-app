import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/list_forum/bloc/list_forum_bloc.dart';

import 'forum_item.dart';

class ListPopularForumWidget extends StatelessWidget {
  const ListPopularForumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async {},
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) =>
            previous.popularForums != current.popularForums,
        builder: (context, state) {
          if (state.popularForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.popularForums!.length,
              itemBuilder: (context, index) {
                if (index != state.popularForums!.length - 1) {
                  return ForumItemWidget(
                    forum: state.popularForums![index],
                  );
                } else {
                  return Column(
                    children: [
                      ForumItemWidget(
                        forum: state.popularForums![index],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      LinearProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  );
                }
              },
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                color: Theme.of(context).hintColor,
                height: 12,
              ),
            );
          }
        },
      ),
    );
  }
}
