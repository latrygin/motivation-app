import 'package:flutter/material.dart';
import 'package:motivation/domain/entity/post.dart';
import 'package:motivation/domain/services/forum_services.dart';

class ForumPageViewModel extends ChangeNotifier {
  ScrollController controller = ScrollController();
  bool isShowFloatingActionButton = false;
  ForumServices forumServices = ForumServices();
  int index = 0;
  List<Post> testvalue = [];
  Future<List<Post>> get getAllListForumPosts => _getAllListForumPosts();
  Future<List<Post>> get getMyListForumPosts => _getMyListForumPosts();

  @override
  void addListener(VoidCallback listener) {
    controller.addListener(() {
      if (controller.position.pixels >= 300 &&
          isShowFloatingActionButton == false) {
        isShowFloatingActionButton = true;
        notifyListeners();
      }
      if (controller.position.pixels <= 300 &&
          isShowFloatingActionButton == true) {
        isShowFloatingActionButton = false;
        notifyListeners();
      }
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        print(index);
        //_getAllListForumPosts();
        notifyListeners();
      }
    });
    super.addListener(listener);
  }

  void scrollUpOnTapFloatingActionButton() {
    controller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  Future<void> pullRefreshFirstTab() async {
    await _getAllListForumPosts();
    notifyListeners();
  }

  Future<List<Post>> _getAllListForumPosts() async {
    var list = await forumServices.getAllForumListFromApi();
    testvalue.addAll(list);
    index++;
    return testvalue;
  }

  Future<void> pullRefreshSecondTab() async {
    await _getMyListForumPosts();
    notifyListeners();
  }

  Future<List<Post>> _getMyListForumPosts() async {
    var list = await forumServices.getMyForumListFromApi();
    return list;
  }

  String differenceDateTime(DateTime time) {
    var now = DateTime.now();
    var dif = now.difference(time);
    if (dif.inMinutes < 60) {
      return '${dif.inMinutes}м';
    } else if (dif.inHours < 24) {
      return '${dif.inHours}ч';
    } else {
      return '${dif.inDays}д';
    }
  }
}
