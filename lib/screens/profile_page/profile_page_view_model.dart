import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/provider/token_provider.dart';
import 'package:motivation/domain/provider/user_provider.dart';

class ProfilePageViewModel extends ChangeNotifier {
  final _userProvider = UserProvider();
  final _tokenProvider = TokenProvider();
  final BuildContext context;
  ProfilePageViewModel({required this.context});

  Future<void> logOutUserAndExitProfile() async {
    await _userProvider.logOutUser();
    await _tokenProvider.deleteTokenFromSecureStore();
    context.go('/');
  }
}
