import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/entity/chat.dart';
import 'package:motivation/domain/services/chat_services.dart';

class ChatPageViewModel extends ChangeNotifier {
  ScrollController controller = ScrollController();
  bool isShowFloatingActionButton = false;
  List<int> selectedItemsList = [];
  bool isModeSelected = false;
  final ChatServices _chatServices = ChatServices();

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

  Future<void> pullRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void deletedListItems() {
    isModeSelected = false;
    selectedItemsList.clear();
    notifyListeners();
  }

  Future<List<Chat>> getChatsUser() async {
    List<Chat> chats = await _chatServices.getChats();
    return chats;
  }

  String differenceDateTime(DateTime time) {
    var now = DateTime.now();
    var dif = now.difference(time);
    if (dif.inMinutes < 60) {
      return '${dif.inMinutes}м назад';
    } else if (dif.inHours < 24) {
      return '${dif.inHours}ч назад';
    } else {
      return '${dif.inDays}д назад';
    }
  }

  void openChatToIndex(BuildContext context, Chat chat) {
    final String location = context.namedLocation('chat', params: {
      'chatId': chat.id.toString(),
    }, queryParams: {
      'name': chat.name,
      'image': chat.image ?? '',
      'status': chat.status.toString(),
      'uid': chat.uid.toString(),
    });
    context.go(location);
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
