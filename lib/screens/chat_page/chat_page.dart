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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const _HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
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
          return const Divider();
        },
        itemBuilder: (context, index) {
          return const _ChatItemWidget();
        });
  }
}

class _ChatItemWidget extends StatelessWidget {
  const _ChatItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
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
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade500),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '10:22',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
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
    return HeaderWidget(
      title: 'Сообщения',
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: SVG(
            Theme.of(context).brightness == Brightness.dark
                ? SVGs.settings_light
                : SVGs.settings_dark,
            onPressed: () {
              print(123);
            },
          ),
        ),
      ],
    );
  }
}
