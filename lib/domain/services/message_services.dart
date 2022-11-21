// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/message.dart';
import 'package:http/http.dart' as http;
import 'package:motivation/domain/provider/token_provider.dart';

class MessageServices {
  final _tokenProvider = TokenProvider();

  Future<List<Message>> getMessagesFromChat(int chatId) async {
    var token = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.messages(chatId), headers: token);

    var items = json.decode(response.body);
    List<Message> listMessage = items.map<Message>((json) {
      return Message.fromMap(json);
    }).toList();

    return listMessage;
  }
}
