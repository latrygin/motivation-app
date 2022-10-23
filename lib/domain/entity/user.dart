// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int id;
  @HiveField(1)
  String? anonymous_name;
  @HiveField(2)
  String name;
  @HiveField(3)
  String email;
  @HiveField(4)
  String? password;
  @HiveField(5)
  String? image;
  @HiveField(6)
  DateTime created_at;
  @HiveField(7)
  DateTime updated_at;

  User({
    required this.id,
    required this.anonymous_name,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
