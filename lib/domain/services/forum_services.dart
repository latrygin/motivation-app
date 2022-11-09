import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/post.dart';
import 'package:motivation/domain/provider/token_provider.dart';

class ForumServices {
  final _tokenProvider = TokenProvider();

  ///Объект класса Logger для вызова
  ///воводов в консоль отладки
  final _loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  ///Получение списка форума
  ///без фильрации
  Future<List<Post>> getAllForumListFromApi() async {
    var header = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.forum, headers: header);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Post> listForumPosts = items.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();
      //_loggerNoStack.v(items);
      return listForumPosts;
    } else {
      print(response.statusCode);
      print(response.body);
      throw 'Лист не получен';
    }
  }

  ///Получение списка форума
  ///без фильрации
  Future<List<Post>> getMyForumListFromApi() async {
    var header = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.myforum, headers: header);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Post> listForumPosts = items.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();
      //_loggerNoStack.v(items);
      return listForumPosts;
    } else {
      throw 'Лист не получен';
    }
  }
}
