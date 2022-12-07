// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, slash_for_doc_comments
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/post.dart';
import 'package:motivation/domain/provider/token_provider.dart';

/**
 * 1. Написать запрос на
 *    ПОЛУЧЕНИЕ поста форума.
 * 2. Написать запрос на
 *    ИЗМЕНЕНИЕ поста форума.
 * 3. Написать запрос на 
 *    УДАЛЕНИЕ поста форума.
 * 4. Написать запрос на 
 *    СОЗДАНИЕ поста форума.
 */

class ForumServices implements ForumServicesInterface {
  final _tokenProvider = TokenProvider();
  static const String MESSAGE_ERROR =
      'Неизвестная ошибка. Мы решаем эту проблему';

  @override
  Future<dynamic> getForums(TypeForum type, int page) async {
    var header = await _tokenProvider.getHeaderWithToken();
    http.Response response;
    switch (type) {
      case TypeForum.New:
        response = await http.get(Url.new_forum(page), headers: header);
        break;
      case TypeForum.Popular:
        response = await http.get(Url.popular_forum(page), headers: header);
        break;
      case TypeForum.My:
        response = await http.get(Url.my_forum(page), headers: header);
        break;
      default:
        throw 'Неизвестный тип';
    }

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Post> listForumPosts = items.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();
      return listForumPosts;
    } else {
      return MESSAGE_ERROR;
    }
  }

  @override
  Future<void> createForum(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteForum(int id) {
    throw UnimplementedError();
  }

  @override
  Future getForum(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> putForum(int id, Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}

abstract class ForumServicesInterface {
  Future<dynamic> getForums(TypeForum type, int page);

  Future<dynamic> getForum(int id);

  Future<void> createForum(Map<String, dynamic> body);

  Future<void> putForum(int id, Map<String, dynamic> body);

  Future<void> deleteForum(int id);
}

enum TypeForum { New, My, Popular }
