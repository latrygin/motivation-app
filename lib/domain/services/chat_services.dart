// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/chat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/domain/provider/token_provider.dart';

class ChatServices implements ChatServicesInterface {
  final _tokenProvider = TokenProvider();
  static const String MESSAGE_ERROR =
      'Неизвестная ошибка. Мы решаем эту проблему';

  @override
  Future<List<Chat>> deleteChat() async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getChatsList() async {
    var token = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.chat, headers: token);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Chat> listChat = items.map<Chat>((json) {
        return Chat.fromMap(json);
      }).toList();
      return listChat;
    } else {
      return MESSAGE_ERROR;
    }
  }
}

abstract class ChatServicesInterface {
  Future<dynamic> getChatsList();

  Future<dynamic> deleteChat();
}
