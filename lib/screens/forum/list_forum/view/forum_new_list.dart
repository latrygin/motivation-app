import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/list_forum/bloc/list_forum_bloc.dart';
import 'package:motivation/screens/forum/list_forum/view/forum_item.dart';

class ListNewForumWidget extends StatefulWidget {
  const ListNewForumWidget({super.key});

  @override
  State<ListNewForumWidget> createState() => _ListNewForumWidgetState();
}

class _ListNewForumWidgetState extends State<ListNewForumWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(_scrollController);
    super.initState();
  }

  Future<void> _scrollController() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      context.read<ListForumBloc>().add(const LoadingNewForumEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async =>
          context.read<ListForumBloc>().add(const InitialNewForumEvent()),
      child: BlocBuilder<ListForumBloc, ListForumState>(
        buildWhen: (previous, current) =>
            previous.newForums != current.newForums ||
            previous.newStatus != current.newStatus,
        builder: (context, state) {
          if (state.newForums == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.separated(
              controller: _controller,
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
                      if (state.newStatus == NewForumStatus.notEnd)
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
              separatorBuilder: (context, index) => const SizedBox(
                width: double.infinity,
                height: 12,
              ),
            );
          }
        },
      ),
    );
  }
}
