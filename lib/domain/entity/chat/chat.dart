// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'chat_friend.dart';
import 'message.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final int id;
  final int first_user_id;
  final int second_user_id;
  final ChatFriend chat_friend;
  final Message message;
  Chat({
    required this.id,
    required this.first_user_id,
    required this.second_user_id,
    required this.chat_friend,
    required this.message,
  });
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
