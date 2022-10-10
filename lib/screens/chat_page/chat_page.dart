import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/widgets/header.dart';
import 'package:motivation/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import 'chat_page_view_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ChatPageViewModel(),
        child: const _ChatBodyWidget(),
      );
}

class _ChatBodyWidget extends StatelessWidget {
  const _ChatBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatPageViewModel>();
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
                        title: 'Поиск по чату',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      _ListChatsWidget(),
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

class _ListChatsWidget extends StatelessWidget {
  const _ListChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Divider(
              height: 1,
              color: Theme.of(context).hintColor,
            ),
          );
        },
        itemBuilder: (context, index) {
          return _ChatItemWidget(index: index);
        });
  }
}

class _ChatItemWidget extends StatelessWidget {
  final int index;
  const _ChatItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatPageViewModel>();
    return Material(
      color: model.isSelectedItem(index)
          ? Theme.of(context).hintColor
          : Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        splashColor: Theme.of(context).hintColor,
        onLongPress: () => model.selectChatItem(index),
        onTap: () => model.isModeSelected ? model.selectChatItem(index) : null,
        child: Container(
          height: 80,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: model.isSelectedItem(index)
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).hintColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: SVG(
                        Theme.of(context).brightness == Brightness.dark
                            ? SVGs.unactive_user_light
                            : SVGs.unactive_user_dark,
                      ),
                    ),
                    model.isSelectedItem(index)
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(Icons.done,
                                  size: 12, color: Colors.white),
                            ))
                        : const SizedBox()
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Anonim',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      maxLines: 2,
                      //textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '10:22',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
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
    final model = context.watch<ChatPageViewModel>();
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack,
        child: model.isModeSelected
            ? HeaderWidget(
                key: const Key("loading"),
                isShadow: model.isShowFloatingActionButton,
                actions: [
                  GestureDetector(
                    child: SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.close_light
                          : SVGs.close_dark,
                      size: size,
                      onPressed: () => model.deletedListItems(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    model.selectedItemsList.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 20),
                  )
                ],
                children: [
                  SVG(
                    Theme.of(context).brightness == Brightness.dark
                        ? SVGs.trash_light
                        : SVGs.trash_dark,
                    size: size,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SVG(
                    Theme.of(context).brightness == Brightness.dark
                        ? SVGs.volume_cross_light
                        : SVGs.volume_cross_dark,
                    size: size,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  SVG(
                    Theme.of(context).brightness == Brightness.dark
                        ? SVGs.volume_high_light
                        : SVGs.volume_high_dark,
                    size: size,
                    onPressed: () {},
                  ),
                ],
              )
            : HeaderWidget(
                key: const Key("normal"),
                isShadow: model.isShowFloatingActionButton,
                title: 'Сообщения',
                children: [
                  SizedBox(
                    width: size,
                    height: size,
                    child: SVG(
                      Theme.of(context).brightness == Brightness.dark
                          ? SVGs.settings_light
                          : SVGs.settings_dark,
                      onPressed: () {},
                    ),
                  ),
                ],
              ));
  }
}
