// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'forum.dart';

part 'forum_response.g.dart';

@JsonSerializable()
class ForumResponse {
  final bool status;
  final List<Forum> forum;
  ForumResponse({
    required this.status,
    required this.forum,
  });
  factory ForumResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForumResponseToJson(this);
}
