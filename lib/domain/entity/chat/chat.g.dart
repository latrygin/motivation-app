// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as int,
      first_user_id: json['first_user_id'] as int,
      second_user_id: json['second_user_id'] as int,
      chat_friend:
          ChatFriend.fromJson(json['chat_friend'] as Map<String, dynamic>),
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'first_user_id': instance.first_user_id,
      'second_user_id': instance.second_user_id,
      'chat_friend': instance.chat_friend,
      'message': instance.message,
    };
