// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forum _$ForumFromJson(Map<String, dynamic> json) => Forum(
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

Map<String, dynamic> _$ForumToJson(Forum instance) => <String, dynamic>{
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
