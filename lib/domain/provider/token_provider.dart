// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';

class TokenProvider {
  static const _KEY_TOKEN = 'api_key_token';
  static Map<String, String> header = {'Content-Type': 'application/json'};

  String getToken() {
    final box = Hive.box<String>(_KEY_TOKEN);
    final value = box.get(_KEY_TOKEN);
    return value!;
  }

  Future<void> setToken(String newToken) async {
    final box = await Hive.openBox<String>(_KEY_TOKEN);
    await box.put(_KEY_TOKEN, newToken);
    await box.close();
  }

  Future<Map<String, String>> getHeaderWithToken() async {
    final box = await Hive.openBox<String>(_KEY_TOKEN);
    final value = box.get(_KEY_TOKEN);
    header.addAll({'Authorization': 'Bearer $value'});
    await box.close();
    return header;
  }

  Future<void> deleteToken() async {
    await Hive.box<String>(_KEY_TOKEN).clear();
  }
}
