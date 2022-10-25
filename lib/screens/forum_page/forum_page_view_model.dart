import 'package:flutter/material.dart';

class ForumPageViewModel extends ChangeNotifier {
  ScrollController controller = ScrollController();
  bool isShowFloatingActionButton = false;

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
    });
    super.addListener(listener);
  }

  void scrollUpOnTapFloatingActionButton() {
    controller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  Future<void> pullRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
