// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class Chat {
  int id;
  int uid;
  String name;
  String? image;
  int status;
  String body;
  DateTime created_at;
  DateTime updated_at;

  Chat(
    this.id,
    this.uid,
    this.name,
    this.image,
    this.status,
    this.body,
    this.created_at,
    this.updated_at,
  );

  Chat copyWith({
    int? id,
    int? uid,
    String? name,
    String? image,
    int? status,
    String? body,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return Chat(
      id ?? this.id,
      uid ?? this.uid,
      name ?? this.name,
      image ?? this.image,
      status ?? this.status,
      body ?? this.body,
      created_at ?? this.created_at,
      updated_at ?? this.updated_at,
    );
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      map['id'] as int,
      map['chat_friend']['id'] as int,
      map['chat_friend']['name'] as String,
      map['chat_friend']['image'] != null ? map['image'] as String : null,
      map['chat_friend']['status'] as int,
      map['message']['body'] as String,
      DateTime.parse(map['message']['created_at'] as String),
      DateTime.parse(map['message']['updated_at'] as String),
    );
  }

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chat(id: $id, uid: $uid, name: $name, image: $image, status: $status, body: $body, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Chat other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.status == status &&
        other.body == body &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        status.hashCode ^
        body.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
