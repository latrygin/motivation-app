import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/chat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/domain/provider/token_provider.dart';

class ChatServices {
  final _tokenProvider = TokenProvider();

  Future<List<Chat>> getChats() async {
    var token = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.chat, headers: token);
    var items = json.decode(response.body);
    List<Chat> listChat = items.map<Chat>((json) {
      return Chat.fromMap(json);
    }).toList();
    //_loggerNoStack.v(items);
    return listChat;
  }
}
