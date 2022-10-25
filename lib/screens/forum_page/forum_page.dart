import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivation/widgets/header.dart';
import 'package:motivation/widgets/search_widget.dart';
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
              _ListForumWidget(),
              Center(
                child: Text("It's rainy here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
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

class _ListForumWidget extends StatelessWidget {
  const _ListForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: model.pullRefresh,
      child: ListView.separated(
        controller: model.controller,
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const _ForumItemWidget();
        },
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          color: Theme.of(context).hintColor,
          height: 12,
        ),
      ),
    );
  }
}

class _ForumItemWidget extends StatelessWidget {
  const _ForumItemWidget({Key? key}) : super(key: key);

  static const String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

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
                        onPressed: () {},
                        child: SVG(
                            Theme.of(context).brightness == Brightness.dark
                                ? SVGs.close_light
                                : SVGs.close_dark)),
                    TextButton(
                        onPressed: () {},
                        child: SVG(
                            Theme.of(context).brightness == Brightness.dark
                                ? SVGs.saved_light
                                : SVGs.saved_dark)),
                    TextButton(
                        onPressed: () {},
                        child: SVG(
                            Theme.of(context).brightness == Brightness.dark
                                ? SVGs.send_light
                                : SVGs.send_dark)),
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
    //final model = context.read<ForumPageViewModel>();
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
                      child: const Text(
                        'Игры',
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('3ч', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
                GestureDetector(
                  onTapDown: (details) => getDialogWindow(context, details),
                  child: SVG(
                    Theme.of(context).brightness == Brightness.dark
                        ? SVGs.more_light
                        : SVGs.more_dark,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Что делать, если друг зовёт в доту?',
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(description,
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
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.unactive_message_light
                          : SVGs.unactive_message_dark,
                      onPressed: () {},
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '32',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.unactive_bookmark_light
                          : SVGs.unactive_bookmark_dark,
                      onPressed: () {},
                      size: 24,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.chevron_down_light
                          : SVGs.chevron_down_dark,
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
                      '132',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 14, color: Colors.green),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.chevron_up_light
                          : SVGs.chevron_up_dark,
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
          Theme.of(context).brightness == Brightness.dark
              ? SVGs.unactive_bookmark_light
              : SVGs.unactive_bookmark_dark,
          size: size,
        ),
        const SizedBox(
          width: 18,
        ),
        SVG(
          Theme.of(context).brightness == Brightness.dark
              ? SVGs.unactive_edit1_light
              : SVGs.unactive_edit1_dark,
          size: size,
        ),
        const SizedBox(
          width: 18,
        ),
        SVG(
          Theme.of(context).brightness == Brightness.dark
              ? SVGs.unactive_filter_light
              : SVGs.unactive_filter_dark,
          size: size,
        ),
        const SizedBox(
          width: 18,
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
