import 'package:flutter/cupertino.dart';
import 'package:motivation/domain/entity/user.dart';
import 'package:motivation/domain/provider/user_provider.dart';

class StatisticPageViewModel extends ChangeNotifier {
  final _userProvider = UserProvider();

  User get userInformation => _userProvider.getUserFromOpenBox();
}
