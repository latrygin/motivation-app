// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

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

  Message copyWith({
    int? id,
    int? chat_id,
    int? to_user_id,
    int? from_user_id,
    String? body,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return Message(
      id: id ?? this.id,
      chat_id: chat_id ?? this.chat_id,
      to_user_id: to_user_id ?? this.to_user_id,
      from_user_id: from_user_id ?? this.from_user_id,
      body: body ?? this.body,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'chat_id': chat_id,
      'to_user_id': to_user_id,
      'from_user_id': from_user_id,
      'body': body,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as int,
      chat_id: map['chat_id'] as int,
      to_user_id: map['to_user_id'] as int,
      from_user_id: map['from_user_id'] as int,
      body: map['body'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, chat_id: $chat_id, to_user_id: $to_user_id, from_user_id: $from_user_id, body: $body, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.chat_id == chat_id &&
        other.to_user_id == to_user_id &&
        other.from_user_id == from_user_id &&
        other.body == body &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        chat_id.hashCode ^
        to_user_id.hashCode ^
        from_user_id.hashCode ^
        body.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
