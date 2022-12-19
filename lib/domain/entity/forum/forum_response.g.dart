// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumResponse _$ForumResponseFromJson(Map<String, dynamic> json) =>
    ForumResponse(
      status: json['status'] as bool,
      forum: (json['forum'] as List<dynamic>)
          .map((e) => Forum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForumResponseToJson(ForumResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'forum': instance.forum,
    };
