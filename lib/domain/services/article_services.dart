// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, slash_for_doc_comments
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/post.dart';
import 'package:motivation/domain/provider/token_provider.dart';

/**
 * 1. Написать запрос на
 *    ПОЛУЧЕНИЕ статьи.
 * 2. Написать запрос на
 *    ИЗМЕНЕНИЕ статьи.
 * 3. Написать запрос на 
 *    УДАЛЕНИЕ статьи.
 * 4. Написать запрос на 
 *    СОЗДАНИЕ статьи.
 */

class ArticleServices implements ArticleServicesInterface {
  final _tokenProvider = TokenProvider();
  static const String MESSAGE_ERROR =
      'Неизвестная ошибка. Мы решаем эту проблему';

  @override
  Future<dynamic> getArticles(TypeArticle type, int page) async {
    var header = await _tokenProvider.getHeaderWithToken();
    http.Response response;
    switch (type) {
      case TypeArticle.New:
        response = await http.get(Url.new_article(page), headers: header);
        break;
      case TypeArticle.Popular:
        response = await http.get(Url.popular_article(page), headers: header);
        break;
      case TypeArticle.My:
        response = await http.get(Url.my_article(page), headers: header);
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
  Future<void> createArticle(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteArticle(int id) {
    throw UnimplementedError();
  }

  @override
  Future getArticle(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> putArticle(int id, Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}

abstract class ArticleServicesInterface {
  Future<dynamic> getArticles(TypeArticle type, int page);

  Future<dynamic> getArticle(int id);

  Future<void> createArticle(Map<String, dynamic> body);

  Future<void> putArticle(int id, Map<String, dynamic> body);

  Future<void> deleteArticle(int id);
}

enum TypeArticle { New, My, Popular }
