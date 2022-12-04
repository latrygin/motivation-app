import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivation/domain/entity/post.dart';
import 'package:provider/provider.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/screens/forum_page/forum_page_view_model.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ForumPageViewModel(),
        child: const _ForumBodyWidget(),
      );
}

class _ForumBodyWidget extends StatelessWidget {
  const _ForumBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: const ForumAppBar(),
          body: const TabBarView(
            children: <Widget>[
              _ListAllForumWidget(),
              Center(
                child: Text("Популярные вопросы"),
              ),
              _ListMyForumWidget(),
            ],
          ),
          floatingActionButton: model.isShowFloatingActionButton
              ? FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () => model.scrollUpOnTapFloatingActionButton(),
                  tooltip: 'Подняться наверх',
                  child: const Icon(
                    CupertinoIcons.chevron_up,
                    size: 18,
                  ),
                )
              : const SizedBox(),
        ));
  }
}

class _ListAllForumWidget extends StatelessWidget {
  const _ListAllForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
    return FutureBuilder<List<Post>>(
        future: model.getAllListForumPosts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).hintColor,
              onRefresh: model.pullRefreshFirstTab,
              child: ListView.separated(
                controller: model.controller,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  if (index != snapshot.data.length - 1) {
                    return _ForumItemWidget(
                      post: data,
                    );
                  } else {
                    return Column(
                      children: [
                        _ForumItemWidget(
                          post: data,
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
              ),
            );
          }
        });
  }
}

class _ListMyForumWidget extends StatelessWidget {
  const _ListMyForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
    return FutureBuilder<List<Post>>(
        future: model.getMyListForumPosts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).hintColor,
              onRefresh: model.pullRefreshSecondTab,
              child: ListView.separated(
                controller: model.controller,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return _ForumItemWidget(
                    post: data,
                  );
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  color: Theme.of(context).hintColor,
                  height: 12,
                ),
              ),
            );
          }
        });
  }
}

class _ForumItemWidget extends StatelessWidget {
  final Post post;
  const _ForumItemWidget({Key? key, required this.post}) : super(key: key);

  void getDialogWindow(BuildContext context, TapDownDetails details) {
    showDialog<void>(
      useSafeArea: false,
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 28, top: details.globalPosition.dy - 50),
              child: Container(
                height: 50,
                width: 160,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {}, child: SVG(SVGs(context).close)),
                    TextButton(
                        onPressed: () {}, child: SVG(SVGs(context).saved)),
                    TextButton(
                        onPressed: () {}, child: SVG(SVGs(context).send)),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<ForumPageViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          //color: Theme.of(context).hintColor,
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
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          color: Theme.of(context).hintColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        post.theme,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(model.differenceDateTime(post.created_at),
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
                GestureDetector(
                  onTapDown: (details) => getDialogWindow(context, details),
                  child: SVG(
                    SVGs(context).more,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              post.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(post.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SVG(
                      SVGs(context).unactive_message,
                      onPressed: () {},
                      size: 22,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      post.count_message.toString(),
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
                      size: 22,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      post.count_view.toString(),
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
                      size: 32,
                    ),
                    // const Icon(
                    //   CupertinoIcons.chevron_down,
                    //   size: 20,
                    // ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      (post.count_up - post.count_down).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 14,
                              color: post.count_up - post.count_down >= 0
                                  ? Colors.green
                                  : Colors.red),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SVG(
                      SVGs(context).chevron_up,
                      size: 32,
                    ),
                    // const Icon(
                    //   CupertinoIcons.chevron_up,
                    //   size: 20,
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ForumAppBar({
    Key? key,
  }) : super(key: key);

  static const double size = 26;
  static const double height = 88;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
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
        indicatorColor: Theme.of(context).primaryColor,
        splashBorderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
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
              )),
          Tab(
              height: 32,
              child: Text(
                'Мои',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
