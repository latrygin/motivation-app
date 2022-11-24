part of 'chat_bloc.dart';

abstract class ChatEvent {}

class InitializationChatsEvent extends ChatEvent {}

class LoadingChatsEvent extends ChatEvent {}
