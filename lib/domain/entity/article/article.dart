// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  int id;
  int uid;
  String type;
  String theme;
  String title;
  String? description;
  String? body;
  String? image;
  int count_view;
  int count_message;
  int count_up;
  int count_down;
  int is_anonymous;
  int is_active;
  DateTime created_at;
  DateTime updated_at;

  Article({
    required this.id,
    required this.uid,
    required this.type,
    required this.theme,
    required this.title,
    required this.description,
    required this.body,
    required this.image,
    required this.count_view,
    required this.count_message,
    required this.count_up,
    required this.count_down,
    required this.is_anonymous,
    required this.is_active,
    required this.created_at,
    required this.updated_at,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
