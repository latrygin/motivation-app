import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/entity/chat/chat.dart';
import 'package:motivation/domain/services/chat_services.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _chatServices = ChatServices();
  ChatBloc() : super(const ChatState()) {
    on<ChatEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<InitialChatEvent>(_initialChats);
  }

  Future<void> _initialChats(
    InitialChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    final chatResponse = await _chatServices.getChats();
    emit(state.copyWith(chats: chatResponse.chat));
  }
}
