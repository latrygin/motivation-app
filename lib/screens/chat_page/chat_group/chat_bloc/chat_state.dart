// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

class ChatState {
  List<Chat> chats;

  bool isLoading;

  ChatState({
    this.chats = const [],
    this.isLoading = false,
  });

  ChatState copyWith({
    bool? isLoading,
    List<Chat>? chats,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      chats: chats ?? this.chats,
    );
  }

  setLoading(bool status) => isLoading = status;
}
