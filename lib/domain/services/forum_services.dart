// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, slash_for_doc_comments
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/provider/token_provider.dart';

import '../entity/forum/forum.dart';
import '../entity/forum/forum_response.dart';
import '../middleware/response_middleware.dart';

class ForumServices implements ForumServicesInterface {
  final _tokenProvider = TokenProvider();
  final _middleware = ResponseMiddleware();

  @override
  Future<ForumResponse> getForums(TypeForum type, int page) async {
    final header = await _tokenProvider.getHeaderWithToken();
    http.Response response;
    switch (type) {
      case TypeForum.news:
        response = await http.get(Url.new_forum(page), headers: header);
        break;
      case TypeForum.popular:
        response = await http.get(Url.popular_forum(page), headers: header);
        break;
      case TypeForum.my:
        response = await http.get(Url.my_forum(page), headers: header);
        break;
      default:
        throw UnimplementedError();
    }
    //Переделать
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    return ForumResponse.fromJson(items);
  }

  @override
  Future<void> createForum(Map<String, dynamic> body) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.post(
      Url.post_forum(),
      headers: header,
      body: jsonEncode(body),
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }

  @override
  Future<void> deleteForum(int id) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.delete(
      Url.delete_forum(id),
      headers: header,
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }

  @override
  Future<Forum> getForum(int id) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.get(
      Url.get_forum(id),
      headers: header,
    );
    //Переделать
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    return Forum.fromJson(items);
  }

  @override
  Future<void> putForum(int id, Map<String, dynamic> body) async {
    final header = await _tokenProvider.getHeaderWithToken();
    final response = await http.put(
      Url.put_forum(id),
      headers: header,
      body: jsonEncode(body),
    );
    _middleware.checkResponse(response.statusCode);
  }
}

abstract class ForumServicesInterface {
  Future<ForumResponse> getForums(TypeForum type, int page);

  Future<Forum> getForum(int id);

  Future<void> createForum(Map<String, dynamic> body);

  Future<void> putForum(int id, Map<String, dynamic> body);

  Future<void> deleteForum(int id);
}

enum TypeForum { news, my, popular }
