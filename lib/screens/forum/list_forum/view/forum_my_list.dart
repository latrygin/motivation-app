import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_forum_bloc.dart';
import 'forum_item.dart';

class ListMyForumWidget extends StatelessWidget {
  const ListMyForumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async {},
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) => previous.myForums != current.myForums,
        builder: (context, state) {
          if (state.myForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.myForums!.length,
              itemBuilder: (context, index) {
                if (index != state.myForums!.length - 1) {
                  return ForumItemWidget(
                    forum: state.myForums![index],
                  );
                } else {
                  return Column(
                    children: [
                      ForumItemWidget(
                        forum: state.myForums![index],
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
