// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'chat_friend.g.dart';

@JsonSerializable()
class ChatFriend {
  final int id;
  final String name;
  final String? image;
  final int status;
  const ChatFriend({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
  });

  factory ChatFriend.fromJson(Map<String, dynamic> json) =>
      _$ChatFriendFromJson(json);

  Map<String, dynamic> toJson() => _$ChatFriendToJson(this);
}
