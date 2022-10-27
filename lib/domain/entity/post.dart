// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Post {
  @HiveField(0)
  int id;
  @HiveField(1)
  int uid;
  @HiveField(2)
  String type;
  @HiveField(3)
  String theme;
  @HiveField(4)
  String title;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String? body;
  @HiveField(7)
  String? image;
  @HiveField(8)
  int count_view;
  @HiveField(9)
  int count_message;
  @HiveField(10)
  int count_up;
  @HiveField(11)
  int count_down;
  @HiveField(12)
  int is_anonymous;
  @HiveField(13)
  int is_active;
  @HiveField(14)
  DateTime created_at;
  @HiveField(15)
  DateTime updated_at;

  Post({
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

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
