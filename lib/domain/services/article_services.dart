// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, slash_for_doc_comments
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/provider/token_provider.dart';

import '../entity/article/article.dart';
import '../entity/article/article_response.dart';
import '../middleware/response_middleware.dart';

class ArticleServices implements ArticleServicesInterface {
  final _tokenProvider = TokenProvider();
  final _middleware = ResponseMiddleware();

  @override
  Future<ArticleResponse> getArticles(TypeArticle type, int page) async {
    final header = await _tokenProvider.getHeaderWithToken();
    http.Response response;
    switch (type) {
      case TypeArticle.news:
        response = await http.get(Url.new_article(page), headers: header);
        break;
      case TypeArticle.popular:
        response = await http.get(Url.popular_article(page), headers: header);
        break;
      case TypeArticle.my:
        response = await http.get(Url.my_article(page), headers: header);
        break;
      default:
        throw UnimplementedError();
    }
    //Переделать
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    return ArticleResponse.fromJson(items);
  }

  @override
  Future<void> createArticle(Map<String, dynamic> body) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.post(
      Url.post_article(),
      headers: header,
      body: jsonEncode(body),
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }

  @override
  Future<void> deleteArticle(int id) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.delete(
      Url.delete_article(id),
      headers: header,
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }

  @override
  Future<Article> getArticle(int id) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.get(Url.get_article(id), headers: header);
    //Переделать
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    return Article.fromJson(items);
  }

  @override
  Future<void> putArticle(int id, Map<String, dynamic> body) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.put(
      Url.put_article(id),
      headers: header,
      body: jsonEncode(body),
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }
}

abstract class ArticleServicesInterface {
  Future<ArticleResponse> getArticles(TypeArticle type, int page);

  Future<Article> getArticle(int id);

  Future<void> createArticle(Map<String, dynamic> body);

  Future<void> putArticle(int id, Map<String, dynamic> body);

  Future<void> deleteArticle(int id);
}

enum TypeArticle { news, my, popular }
