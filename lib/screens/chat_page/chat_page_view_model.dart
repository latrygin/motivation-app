import 'package:flutter/material.dart';

class ChatPageViewModel extends ChangeNotifier {
  ScrollController controller = ScrollController();
  bool isShowFloatingActionButton = false;
  List<int> selectedItemsList = [];
  bool isModeSelected = false;

  void selectChatItem(int index) {
    if (selectedItemsList.contains(index)) {
      selectedItemsList.remove(index);
    } else {
      selectedItemsList.add(index);
    }
    selectedItemsList.isEmpty ? isModeSelected = false : isModeSelected = true;
    notifyListeners();
  }

  bool isSelectedItem(int index) => selectedItemsList.contains(index);

  void deletedListItems() {
    isModeSelected = false;
    selectedItemsList.clear();
    notifyListeners();
  }

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
}
