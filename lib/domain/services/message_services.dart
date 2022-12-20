// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/middleware/response_middleware.dart';
import 'package:motivation/domain/provider/token_provider.dart';

class MessageServices implements MessageServicesInterface {
  final _tokenProvider = TokenProvider();
  final _middleware = ResponseMiddleware();
  @override
  Future<dynamic> getMessages(int chatId) async {
    final token = await _tokenProvider.getHeaderWithToken();
    final response = await http.get(Url.messages(chatId), headers: token);
    //Переделать
    _middleware.checkResponse(response.statusCode);
  }

  @override
  Future<void> deleteMessages(int messageId) {
    throw UnimplementedError();
  }

  @override
  Future<void> editMessages(int messageId) {
    throw UnimplementedError();
  }
}

abstract class MessageServicesInterface {
  Future<dynamic> getMessages(int chatId);
  Future<void> editMessages(int messageId);
  Future<void> deleteMessages(int messageId);
}
