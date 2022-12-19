// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  final bool status;
  final List<Article> article;
  ArticleResponse({
    required this.status,
    required this.article,
  });
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
