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
  ///выводов в консоль отладки
  final _loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  ///Объект класса UserProvider для получения данных пользователя
  ///из локальной базы данных или для установления новых при входе
  final _userInLocalStorage = UserProvider();

  final _tokenProvider = TokenProvider();

  /// Регистрация пользователя
  /// Передача параметров name, email, password и
  /// password_confirmation
  ///
  /// Возвращает статус запроса
  ///
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

  /// Вход
  /// Выполнение входа, если успешно выполнен вход
  /// Тогда данные заносятся в локальную базу данных

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
      _userInLocalStorage.setUserDataInLocalStorage(getUserFromLoginApi);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /// Удаление пользователя
  /// Отправляется запрос и возвращаетс статус запроса
  Future<int> deleteUser(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    var response =
        await http.delete(Url.deleteProfile, headers: header, body: body);

    var items = json.decode(response.body);

    _loggerNoStack.v(items);
    return response.statusCode;
  }

  ///Функция выполняния автоматического входа
  ///достаются данные из локального хранилища Hive
  ///выполняется функция входа передавая данныеи возвращает
  ///Future<bool>: true - выполнен вход, false - данные устарели
  ///или пользователь ещё не регистрировался
  Future<bool> autoLogin() async {
    var user = await _userInLocalStorage.getUserDataFromLocalStorage();
    //Проверка наличия пользователя
    if (user != null) {
      //Если пользователь есть в локальной бд
      var statusCode = await loginUser(user.email, user.password ?? '');
      if (statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      //Если пользователь отсутствует
      return false;
    }
  }
}
