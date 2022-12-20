// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:motivation/domain/entity/user.dart';

class UserProvider {
  ///Ключ открытия бокса и нахождения
  ///в под этим ключём в боксе
  static const String _USER_BOX = 'user_box_key';

  ///Установить данные пользователя в Базу данных
  ///Hive. Устанавливать при входе и автовходе и вывод
  ///информации в настройках
  ///@param [user]
  ///@return void

  Future<void> setUser(User user) async {
    //Достать коробку UserAdapter

    final box = await _getAndOpenBoxUserAdapter();

    //Установить параметры пользователя

    await box.put(_USER_BOX, user);

    //Закрываем коробку

    await box.close();
  }

  ///Получить данные о пальзователе из базы данных
  ///Hive. Устанавливать при входе и автовходе и вывод
  ///информации в настройках
  //
  ///@return void

  Future<User?> getUser() async {
    //Достать коробку UserAdapter

    final box = await _getAndOpenBoxUserAdapter();

    //Достать пользователя по ключу

    final user = box.get(_USER_BOX);

    //Закрываем коробку

    await box.close();
    return user;
  }

  ///Выход пользователя из приложения
  ///и очистка коробки User и системы
  Future<bool> deleteUser() async {
    //Открытие коробки и регистрации адаптера
    final box = await _getAndOpenBoxUserAdapter();

    //Очистка и закрытие коробки

    await box.deleteFromDisk();
    await box.close();
    return true;
  }

  ///Проверка регистрации коробки
  ///и открытие её
  ///@return [Box<User>]
  Future<Box<User>> _getAndOpenBoxUserAdapter() async {
    //Регистрация адаптера

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserAdapter());
    }

    //Открытие коробки

    final box = await Hive.openBox<User>(_USER_BOX);
    return box;
  }
}
