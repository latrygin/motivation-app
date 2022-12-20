// ignore_for_file: only_throw_errors

//Переделать
class ResponseMiddleware {
  void checkResponse(int status) {
    switch (status) {
      case 200:
      case 201:
      case 202:
        break;
      case 401:
        throw 'Неавторизован';
      case 404:
        throw 'Не найден';
      case 406:
        throw 'Не пройдена валидация';

      default:
        throw 'Неизвестная ошибка $status';
    }
  }
}
