import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/list_forum/bloc/list_forum_bloc.dart';

import 'forum_item.dart';

class ListPopularForumWidget extends StatefulWidget {
  const ListPopularForumWidget({super.key});

  @override
  State<ListPopularForumWidget> createState() => _ListPopularForumWidgetState();
}

class _ListPopularForumWidgetState extends State<ListPopularForumWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(_scrollController);
    super.initState();
  }

  Future<void> _scrollController() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      context.read<ListForumBloc>().add(const LoadingPopularForumEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async =>
          context.read<ListForumBloc>().add(const InitialPopularForumEvent()),
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) =>
            previous.popularForums != current.popularForums ||
            previous.popularPage != current.popularPage ||
            previous.popularStatus != current.popularStatus,
        builder: (context, state) {
          if (state.popularForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              controller: _controller,
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
                      if (state.popularStatus == PopularForumStatus.notEnd)
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
