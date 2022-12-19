// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable()
class Message {
  int id;
  int chat_id;
  int to_user_id;
  int from_user_id;
  String body;
  DateTime created_at;
  DateTime updated_at;
  Message({
    required this.id,
    required this.chat_id,
    required this.to_user_id,
    required this.from_user_id,
    required this.body,
    required this.created_at,
    required this.updated_at,
  });
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
