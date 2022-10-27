// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 2;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      id: fields[0] as int,
      uid: fields[1] as int,
      type: fields[2] as String,
      theme: fields[3] as String,
      title: fields[4] as String,
      description: fields[5] as String?,
      body: fields[6] as String?,
      image: fields[7] as String?,
      count_view: fields[8] as int,
      count_message: fields[9] as int,
      count_up: fields[10] as int,
      count_down: fields[11] as int,
      is_anonymous: fields[12] as int,
      is_active: fields[13] as int,
      created_at: fields[14] as DateTime,
      updated_at: fields[15] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.theme)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.body)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.count_view)
      ..writeByte(9)
      ..write(obj.count_message)
      ..writeByte(10)
      ..write(obj.count_up)
      ..writeByte(11)
      ..write(obj.count_down)
      ..writeByte(12)
      ..write(obj.is_anonymous)
      ..writeByte(13)
      ..write(obj.is_active)
      ..writeByte(14)
      ..write(obj.created_at)
      ..writeByte(15)
      ..write(obj.updated_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      uid: json['uid'] as int,
      type: json['type'] as String,
      theme: json['theme'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      body: json['body'] as String?,
      image: json['image'] as String?,
      count_view: json['count_view'] as int,
      count_message: json['count_message'] as int,
      count_up: json['count_up'] as int,
      count_down: json['count_down'] as int,
      is_anonymous: json['is_anonymous'] as int,
      is_active: json['is_active'] as int,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'type': instance.type,
      'theme': instance.theme,
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'image': instance.image,
      'count_view': instance.count_view,
      'count_message': instance.count_message,
      'count_up': instance.count_up,
      'count_down': instance.count_down,
      'is_anonymous': instance.is_anonymous,
      'is_active': instance.is_active,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
