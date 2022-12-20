import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat.dart';
import 'chat_item.dart';

class ListChatsWidget extends StatelessWidget {
  const ListChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).hintColor,
      onRefresh: () async {}, //model.pullRefresh,
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state.chats != null) {
            if (state.chats!.isEmpty) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.chats!.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Theme.of(context).hintColor,
                  );
                },
                itemBuilder: (context, index) {
                  return ChatItemWidget(chat: state.chats![index]);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
