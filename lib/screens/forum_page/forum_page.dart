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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                  controller: model.controller,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      SearchWidget(
                        title: 'Поиск по форуму',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      _ListForumWidget(),
                    ],
                  )),
            )
          ],
        ),
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
    );
  }
}

class _ListForumWidget extends StatelessWidget {
  const _ListForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return const _ForumItemWidget();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
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
                  right: 54, top: details.globalPosition.dy - 50),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'Игры',
                  ),
                ),
                GestureDetector(
                  onTapDown: (details) => getDialogWindow(context, details),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.unactive_more_light
                          : SVGs.unactive_more_dark,
                      //onPressed: () => getDialogWindow(context),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
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
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _StatisticItemWidget(
                  icon: CupertinoIcons.eye_fill,
                  title: '3.2k',
                ),
                SizedBox(
                  width: 4,
                ),
                _StatisticItemWidget(
                  icon: CupertinoIcons.hand_thumbsup_fill,
                  title: '1.2k',
                ),
                SizedBox(
                  width: 4,
                ),
                _StatisticItemWidget(
                  icon: CupertinoIcons.hand_thumbsdown_fill,
                  title: '52',
                ),
                SizedBox(
                  width: 4,
                ),
                _StatisticItemWidget(
                  icon: CupertinoIcons.chat_bubble_fill,
                  title: '187',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const _StatisticItemWidget(
      {Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4, left: 10, right: 10, top: 4),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
            color: Colors.grey.shade700,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);
  static const double size = 28;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ForumPageViewModel>();
    return HeaderWidget(
      title: 'Форум',
      isShadow: model.isShowFloatingActionButton,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: SVG(
            Theme.of(context).brightness == Brightness.dark
                ? SVGs.saved_light
                : SVGs.saved_dark,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        SizedBox(
          width: size,
          height: size,
          child: SVG(
            Theme.of(context).brightness == Brightness.dark
                ? SVGs.edit_light
                : SVGs.edit_dark,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        SizedBox(
          width: size,
          height: size,
          child: SVG(
            Theme.of(context).brightness == Brightness.dark
                ? SVGs.filter_light
                : SVGs.filter_dark,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
