import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import 'chat_body.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ChatBloc()..add(const InitialChatEvent()),
        child: const ChatBody(),
      );
}
