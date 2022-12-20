// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final bool isSelectMode;
  final List<int>? selectedChats;
  final List<Chat>? chats;

  const ChatState({
    this.isSelectMode = false,
    this.selectedChats,
    this.chats,
  });

  @override
  List<Object?> get props => [isSelectMode, selectedChats, chats];

  ChatState copyWith({
    bool? isSelectMode,
    List<int>? selectedChats,
    List<Chat>? chats,
  }) {
    return ChatState(
      isSelectMode: isSelectMode ?? this.isSelectMode,
      selectedChats: selectedChats ?? this.selectedChats,
      chats: chats ?? this.chats,
    );
  }
}
