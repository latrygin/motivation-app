// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/message.dart';
import 'package:http/http.dart' as http;
import 'package:motivation/domain/provider/token_provider.dart';

class MessageServices implements MessageServicesInterface {
  final _tokenProvider = TokenProvider();
  static const String MESSAGE_ERROR =
      'Неизвестная ошибка. Мы решаем эту проблему';

  @override
  Future<dynamic> getMessages(int chatId) async {
    var token = await _tokenProvider.getHeaderWithToken();
    var response = await http.get(Url.messages(chatId), headers: token);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Message> listMessage = items.map<Message>((json) {
        return Message.fromMap(json);
      }).toList();

      return listMessage;
    } else {
      return MESSAGE_ERROR;
    }
  }

  @override
  Future<void> deleteMessages(int messageId) {
    // TODO: implement deleteMessages
    throw UnimplementedError();
  }

  @override
  Future<void> editMessages(int messageId) {
    // TODO: implement editMessages
    throw UnimplementedError();
  }
}

abstract class MessageServicesInterface {
  Future<dynamic> getMessages(int chatId);
  Future<void> editMessages(int messageId);
  Future<void> deleteMessages(int messageId);
}
