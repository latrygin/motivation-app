import 'package:flutter/cupertino.dart';
import 'package:motivation/domain/provider/token_provider.dart';

class ProfilePageViewModel extends ChangeNotifier {
  //final _userProvider = UserProvider();
  final BuildContext context;
  final _tokenProvider = TokenProvider();
  ProfilePageViewModel({required this.context});

  Future<void> logOutUserAndExitProfile() async {
    // await _userProvider.deleteUser();
    await _tokenProvider.deleteToken();
    //context.go('/');
  }
}
