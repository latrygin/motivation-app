import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/domain/entity/message.dart';
import 'package:motivation/screens/chat_page/open_chat/open_chat_page_view_model.dart';
import 'package:provider/provider.dart';

class OpenChatScreen extends StatelessWidget {
  final int chatId;
  final int uid;
  final int status;
  final String name;
  final String image;

  const OpenChatScreen(
      {super.key,
      required this.chatId,
      required this.uid,
      required this.status,
      required this.name,
      required this.image});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => OpenChatPageViewModel(
            chatId: chatId, uid: uid, name: name, image: image, status: status),
        child: const _OpenChatBodyWidget(),
      );
}

class _OpenChatBodyWidget extends StatelessWidget {
  const _OpenChatBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const OpenChatAppBar(),
        body: const SafeArea(child: _Chat()));
  }
}

class _Chat extends StatelessWidget {
  const _Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: _ChatGroup(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            //color: Theme.of(context).scaffoldBackgroundColor,
            child: const _SendMessage(),
          ),
        )
      ],
    );
  }
}

class _ChatGroup extends StatelessWidget {
  const _ChatGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OpenChatPageViewModel>();
    return Container(
      color: Theme.of(context).hintColor,
      child: StreamBuilder<ChatState>(
        stream: model.stream,
        initialData: model.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 14),
            reverse: true,
            itemCount: snapshot.requireData.messages.length,
            itemBuilder: (context, index) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                var data = snapshot.requireData.messages[index];
                if (index != snapshot.requireData.messages.length - 1) {
                  if (snapshot.requireData.messages[index].created_at.day !=
                      snapshot.requireData.messages[index + 1].created_at.day) {
                    return Column(
                      children: [
                        _MessageItem(
                          message: data,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 6),
                            child: Text(
                              'Новые сообщения',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return _MessageItem(
                      message: data,
                    );
                  }
                } else {
                  return _MessageItem(
                    message: data,
                  );
                }
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
          );
        },
      ),
    );
  }
}

class _SendMessage extends StatelessWidget {
  const _SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<OpenChatPageViewModel>();
    return Padding(
        padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4, right: 12),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () => model.sendMessage(),
                icon: SVG(
                  Theme.of(context).brightness == Brightness.dark
                      ? SVGs.menu_light
                      : SVGs.menu_dark,
                  size: 28,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                  controller: model.messageControler,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).hintColor,
                    fillColor: Theme.of(context).hintColor,
                    hoverColor: Theme.of(context).hintColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.only(
                        right: 16, left: 16, top: 0, bottom: 0),
                    hintText: 'Написать сообщение...',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).hoverColor),
                  )),
            ),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () => model.sendMessage(),
                icon: SVG(
                  Theme.of(context).brightness == Brightness.dark
                      ? SVGs.send_light
                      : SVGs.send_dark,
                  size: 28,
                ),
              ),
            ),
          ],
        ));
  }
}

class _MessageItem extends StatelessWidget {
  final Message message;
  const _MessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final model = context.read<OpenChatPageViewModel>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      child: Row(
        children: [
          model.checkFromMessage(message.from_user_id)
              ? const Expanded(flex: 1, child: SizedBox())
              : const SizedBox(),
          Expanded(
              flex: message.body.length > 36 ? 7 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: model.checkFromMessage(message.from_user_id)
                      ? Theme.of(context).hoverColor
                      : Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(14),
                    topRight: const Radius.circular(14),
                    bottomLeft: model.checkFromMessage(message.from_user_id)
                        ? const Radius.circular(14)
                        : const Radius.circular(0),
                    bottomRight: model.checkFromMessage(message.from_user_id)
                        ? const Radius.circular(0)
                        : const Radius.circular(14),
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 8, left: 12, right: 12, bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message.body,
                      style: TextStyle(
                          fontSize: 16,
                          color: model.checkFromMessage(message.from_user_id)
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).hoverColor),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${message.created_at.hour}:${message.created_at.minute < 10 ? '0' : ''}${message.created_at.minute}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 10,
                                  color: model.checkFromMessage(
                                          message.from_user_id)
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Theme.of(context).hoverColor),
                        ),
                        model.checkFromMessage(message.from_user_id)
                            ? const SizedBox(
                                width: 4,
                              )
                            : const SizedBox(),
                        model.checkFromMessage(message.from_user_id)
                            ? Icon(
                                Icons.done_all,
                                size: 14,
                                color: model
                                        .checkFromMessage(message.from_user_id)
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Theme.of(context).hoverColor,
                              )
                            : const SizedBox()
                      ],
                    )
                  ],
                ),
              )),
          model.checkFromMessage(message.from_user_id)
              ? const SizedBox()
              : const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }
}

class OpenChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OpenChatAppBar({super.key});

  static const double size = 26;
  static const double height = 64;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OpenChatPageViewModel>();

    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: double.infinity,
            child: Row(
              children: [
                StreamBuilder(
                  stream: model.channel.stream,
                  builder: (context, snapshot) {
                    print(model.channel.stream.isBroadcast);
                    final data = jsonDecode(snapshot.data.toString());
                    if (data != null) {
                      print(data);
                      model.setNewMessage(snapshot.data.toString());
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                SVG(
                  Theme.of(context).brightness == Brightness.dark
                      ? SVGs.chevron_left_light
                      : SVGs.chevron_left_dark,
                  size: size,
                  onPressed: () => context.pop(),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      padding: const EdgeInsets.all(8),
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
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 16),
                          ),
                          Text(
                            model.status == 1 ? 'online' : 'ofline',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: model.status == 1
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).hoverColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                SVG(
                  Theme.of(context).brightness == Brightness.dark
                      ? SVGs.settings_light
                      : SVGs.settings_dark,
                  size: size,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
