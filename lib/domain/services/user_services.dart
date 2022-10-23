// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/user.dart';
import 'package:motivation/domain/provider/token_provider.dart';
import 'package:motivation/domain/provider/user_provider.dart';

class UserServices {
  ///Заголовок для запросов без токена, для
  ///регистрации и входа
  static Map<String, String> header = {'Content-Type': 'application/json'};

  ///Объект класса Logger для вызова
  ///воводов в консоль отладки
  final _loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  ///Объект класса UserProvider для получения данных пользователя
  ///из локальной базы данных или для установления новых при входе
  final _saveUserDataInLocalStorage = UserProvider();

  final _tokenProvider = TokenProvider();

  /// <h1>Регистрация</h1>
  /// <h3>Функция регистрации
  /// пользователя для страницы Registration_page</h3>
  /// (?) Отправлять письмо на почту
  /// <p>@param [email]</p>
  /// <p>@param [password]</p>
  /// <p>http запрос на выполнение входа</p>
  /// <p>@return [statuscode]</p>
  /// При статусе 201 - Пользователь успешно зарегистрировался
  /// При статусе 422 - Данные не прошли валидацию

  Future<int> registrationUser(String name, String email, String password,
      String password_confirmation) async {
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation
    });
    var response =
        await http.post(Url.registration, headers: header, body: body);

    return response.statusCode;
  }

  /// <h1>Вход</h1>
  /// <h3>Функция для выполнения входа
  /// пользователя в приложение через
  /// логин и пароль</h3>
  /// (?) Отправлять письмо на почту
  /// <p>@param [email]</p>
  /// <p>@param [password]</p>
  /// <p>http запрос на выполнение входа</p>
  /// <p>@return [statuscode]</p>

  Future<int> loginUser(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    var response = await http.post(Url.login, headers: header, body: body);
    var items = json.decode(response.body);

    if (response.statusCode == 200) {
      User getUserFromLoginApi = User.fromJson(items);

      _loggerNoStack.v(items);

      ///Установить токен в secure storage

      _tokenProvider.setTokenInHeader(items['api_token']);

      ///Установить данные о пользователе
      ///в базу данных Hive.
      ///Установить введённый пароль

      getUserFromLoginApi.password = password;
      _saveUserDataInLocalStorage
          .setUserDataInLocalStorage(getUserFromLoginApi);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /// <h1>Удаление профиля</h1>
  /// <h3>Функция для удаления профиля по почте и паролю</h3>
  /// (?) Отправлять письмо на почту с кодом
  /// <p>@param [email]</p>
  /// <p>@param [password]</p>
  /// <p>http запрос на удаление профиля</p>
  /// <p>@return [statuscode]</p>

  Future<int> deleteUser(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    var response =
        await http.delete(Url.deleteProfile, headers: header, body: body);

    var items = json.decode(response.body);

    _loggerNoStack.v(items);
    return response.statusCode;
  }
}
