import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: const ChatAppBar(),
            body: const TabBarView(
              children: <Widget>[
                ListChatsWidget(),
                Center(
                  child: Text('Group'),
                ),
                Center(
                  child: Text("It's sunny here"),
                ),
              ],
            ),
            floatingActionButton: state.isSelectMode
                ? FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                    //onPressed: () => model.scrollUpOnTapFloatingActionButton(),
                    tooltip: 'Подняться наверх',
                    child: const Icon(
                      CupertinoIcons.chevron_up,
                      size: 18,
                    ),
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
