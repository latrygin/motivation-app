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

  Future<void> setUserDataInLocalStorage(User user) async {
    //Достать коробку UserAdapter

    var box = await _getAndOpenBoxUserAdapter();

    //Установить параметры пользователя

    box.put(_USER_BOX, user);

    //Закрываем коробку

    // box.close();
  }

  ///Получить данные о пальзователе из базы данных
  ///Hive. Устанавливать при входе и автовходе и вывод
  ///информации в настройках
  //
  ///@return void

  Future<User?> getUserDataFromLocalStorage() async {
    //Достать коробку UserAdapter

    var box = await _getAndOpenBoxUserAdapter();

    //Достать пользователя по ключу

    var user = box.get(_USER_BOX);

    //Закрываем коробку

    // box.close();
    return user;
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

    var box = await Hive.openBox<User>(_USER_BOX);
    return box;
  }

  ///Выход пользователя из приложения
  ///и очистка коробки User и системы
  Future<bool> logOutUser() async {
    //Открытие коробки и регистрации адаптера
    var box = await _getAndOpenBoxUserAdapter();

    //Очистка и закрытие коробки

    box.deleteFromDisk();
    box.close();
    return true;
  }

  ///Достать пользователя из открытой коробки
  ///
  User getUserFromOpenBox() {
    var box = Hive.box<User>(_USER_BOX);
    return box.get(_USER_BOX)!;
  }
}
