// ignore_for_file: constant_identifier_names
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class TokenProvider {
  ///Создание класса для работы с secure_storage
  final _storage = const FlutterSecureStorage();

  ///Ключ, под которым хранится api_token
  static const _KEY_TOKEN = 'api_key_token';

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  final Map<String, String> _header = {'Content-Type': 'application/json'};

  ///Получение токена
  ///Достаёт переменную из secure_storage и
  ///добавляет к дефолтному заголовку
  ///<p>'Content-Type': 'application/json'</p>
  ///<p>Взвращает два элемента Map с токеном
  ///и контент json</p>
  ///<p>@return Map<String, String> [_header]</p>

  Future<Map<String, String>> getHeaderWithToken() async {
    String? value = await _storage.read(key: _KEY_TOKEN);
    _header.addAll({'Authorization': 'Bearer $value'});
    loggerNoStack.v(_header);
    return _header;
  }

  ///Установить токен в secure_storage
  ///<p>@param String [newToken]</p>
  ///<p>@return void</p>

  Future<void> setTokenInHeader(String newToken) async {
    await _storage.write(key: _KEY_TOKEN, value: newToken);
    loggerNoStack.v(await _storage.read(key: _KEY_TOKEN));
  }
}
