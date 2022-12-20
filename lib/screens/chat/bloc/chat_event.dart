part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatSelectEvent extends ChatEvent {
  const ChatSelectEvent();

  @override
  List<Object> get props => [];
}

class InitialChatEvent extends ChatEvent {
  const InitialChatEvent();

  @override
  List<Object> get props => [];
}
