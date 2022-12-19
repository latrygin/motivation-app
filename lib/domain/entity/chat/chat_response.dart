// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'chat.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  final bool status;
  final List<Chat> chat;
  ChatResponse({
    required this.status,
    required this.chat,
  });
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
