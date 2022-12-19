// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int,
      chat_id: json['chat_id'] as int,
      to_user_id: json['to_user_id'] as int,
      from_user_id: json['from_user_id'] as int,
      body: json['body'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chat_id,
      'to_user_id': instance.to_user_id,
      'from_user_id': instance.from_user_id,
      'body': instance.body,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
