// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/user.dart';
import 'package:motivation/domain/middleware/response_middleware.dart';
import 'package:motivation/domain/provider/token_provider.dart';

class UserServices {
  static Map<String, String> header = {'Content-Type': 'application/json'};
  final _middleware = ResponseMiddleware();
  final _tokenProvider = TokenProvider();

  Future<User> login(
    String email,
    String password,
  ) async {
    final body = jsonEncode({'email': email, 'password': password});
    final response = await http.post(
      Url.login,
      headers: header,
      body: body,
    );
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    final getUserFromLoginApi = User.fromJson(items);
    await _tokenProvider.setToken(items['api_token'] as String);
    getUserFromLoginApi.password = password;
    return getUserFromLoginApi;
  }

  Future<int> registration(
    String name,
    String email,
    String password,
    String password_confirmation,
  ) async {
    final body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation
    });
    final response = await http.post(
      Url.registration,
      headers: header,
      body: body,
    );

    _middleware.checkResponse(response.statusCode);
    return response.statusCode;
  }

  Future<int> delete(String email, String password) async {
    final body = jsonEncode({'email': email, 'password': password});
    final response = await http.delete(
      Url.deleteProfile,
      headers: header,
      body: body,
    );
    _middleware.checkResponse(response.statusCode);
    return response.statusCode;
  }

  Future<bool> autoAuth() async {
    return true;
    // try {
    //   final user = await UserProvider().getUser();
    //   if (user != null) {
    //     final statusCode = await login(user.email, user.password ?? '');
    //     if (statusCode == 200) {
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   } else {
    //     return false;
    //   }
    //   return true;
    // } catch (error) {
    //   throw 'WARNING: Error auto auth $error';
    // }
  }
}
