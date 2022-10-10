import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class ForumPageViewModel extends ChangeNotifier {
  ScrollController controller = ScrollController();
  bool isShowFloatingActionButton = false;

  @override
  void addListener(VoidCallback listener) {
    controller.addListener(() {
      if (controller.position.pixels >= 600 &&
          isShowFloatingActionButton == false) {
        isShowFloatingActionButton = true;
        notifyListeners();
      }
      if (controller.position.pixels <= 600 &&
          isShowFloatingActionButton == true) {
        isShowFloatingActionButton = false;
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
}
