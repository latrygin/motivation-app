// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFriend _$ChatFriendFromJson(Map<String, dynamic> json) => ChatFriend(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String?,
      status: json['status'] as int,
    );

Map<String, dynamic> _$ChatFriendToJson(ChatFriend instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'status': instance.status,
    };
