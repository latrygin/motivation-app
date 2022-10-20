import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivation/screens/blog_page/blog_page_view_model.dart';
import 'package:motivation/widgets/header.dart';
import 'package:motivation/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => BlogPageViewModel(),
        child: const _BlogBodyWidget(),
      );
}

class _BlogBodyWidget extends StatelessWidget {
  const _BlogBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BlogPageViewModel>();
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
                      // SearchWidget(
                      //   title: 'Поиск по форуму',
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      _ListBlogWidget(),
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

class _ListBlogWidget extends StatelessWidget {
  const _ListBlogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return const _BlogItemWidget();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
    );
  }
}

class _BlogItemWidget extends StatelessWidget {
  const _BlogItemWidget({Key? key}) : super(key: key);

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
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Игры',
                    style: Theme.of(context).textTheme.headlineSmall,
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
              height: 8,
            ),
            Text(
              'Что делать, если друг зовёт в доту?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: SVG(
                        Theme.of(context).brightness == Brightness.dark
                            ? SVGs.unactive_user_light
                            : SVGs.unactive_user_dark,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Latrygin Arseniy',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.eye_fill,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '342',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      CupertinoIcons.hand_thumbsup_fill,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '52',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);
  static const double size = 28;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<BlogPageViewModel>();
    return HeaderWidget(
      title: 'Статьи',
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
