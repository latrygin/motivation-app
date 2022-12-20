import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/list_forum/bloc/list_forum_bloc.dart';
import 'package:motivation/screens/forum/list_forum/view/forum_item.dart';

class ListNewForumWidget extends StatelessWidget {
  const ListNewForumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async {},
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) =>
            previous.newForums != current.newForums,
        builder: (context, state) {
          if (state.newForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.newForums!.length,
              itemBuilder: (context, index) {
                if (index != state.newForums!.length - 1) {
                  return ForumItemWidget(
                    forum: state.newForums![index],
                  );
                } else {
                  return Column(
                    children: [
                      ForumItemWidget(
                        forum: state.newForums![index],
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
