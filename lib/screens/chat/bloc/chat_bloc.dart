import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/entity/chat/chat.dart';
import 'package:motivation/domain/services/chat_services.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatServices _chatServices;
  ChatBloc({
    required ChatServices chatServices,
  })  : _chatServices = chatServices,
        super(const ChatState()) {
    on<ChatEvent>((event, emit) {});
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
