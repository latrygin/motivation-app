// import 'package:flutter_test/flutter_test.dart';
// import 'package:motivation/domain/provider/token_provider.dart';
// import 'package:motivation/domain/services/user_services.dart';
// import 'package:motivation/screens/auth_pages/login_page/login_page_view_model.dart';

// void loginTest() {
//   test('Тестирование регистрации', () async {
//     UserServices userService = UserServices();
//     var statusCode = await userService.registrationUser(
//         'Arseniy', 'lartygin@yandex.ru', '12345678', '12345678');
//     expect(statusCode, 201);
//   });

//   test('Тестирование входа', () async {
//     UserServices userService = UserServices();
//     var statusCode =
//         await userService.loginUser('lartygin@yandex.ru', '12345678');
//     expect(statusCode, 200);
//   });

//   test('Тестирование регистрации с повторяющейся почтой', () async {
//     UserServices userService = UserServices();
//     var statusCode = await userService.registrationUser(
//         'Arseniy', 'lartygin@yandex.ru', '12345678', '12345678');
//     expect(statusCode, 422);
//   });

//   test('Тестирование удаления профиля', () async {
//     UserServices userService = UserServices();
//     var statusCode = await userService.deleteUser(
//       'lartygin@yandex.ru',
//       '12345678',
//     );
//     expect(statusCode, 200);
//   });
// }

// void tokenProviderTest() {
//   test('Тестирование токена в заголовке', () async {
//     var tokenProvider = TokenProvider();
//     Map<String, String> header = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer 12345678'
//     };
//     tokenProvider.setTokenInHeader('12345678');
//     var testheader = await tokenProvider.getHeaderWithToken();
//     expect(testheader, header);
//   });
// }
