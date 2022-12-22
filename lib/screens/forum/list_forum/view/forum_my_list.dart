import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_forum_bloc.dart';
import 'forum_item.dart';

class ListMyForumWidget extends StatefulWidget {
  const ListMyForumWidget({super.key});

  @override
  State<ListMyForumWidget> createState() => _ListMyForumWidgetState();
}

class _ListMyForumWidgetState extends State<ListMyForumWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(_scrollController);
    super.initState();
  }

  Future<void> _scrollController() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      context.read<ListForumBloc>().add(const LoadingMyForumEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async =>
          context.read<ListForumBloc>().add(const InitialMyForumEvent()),
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) =>
            previous.myForums != current.myForums ||
            previous.myPage != current.myPage ||
            previous.myStatus != current.myStatus,
        builder: (context, state) {
          if (state.myForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              controller: _controller,
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
                      if (state.myStatus == MyForumStatus.notEnd)
                        LinearProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        )
                      else
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Theme.of(context).hintColor,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: const Text('Конец списка'),
                            ),
                            Container(
                              width: double.infinity,
                              height: 24,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ],
                        ),
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
