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

  void getDialogWindow(BuildContext context, TapDownDetails details) {
    showDialog<void>(
      useSafeArea: false,
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 54, top: details.globalPosition.dy - 50),
              child: Container(
                height: 50,
                width: 240,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _GifCustomWidget(
                      title: 'bookmark.gif',
                    ),
                    _GifCustomWidget(
                      title: 'bookmark.gif',
                    ),
                    _GifCustomWidget(
                      title: 'bookmark.gif',
                    ),
                    _GifCustomWidget(
                      title: 'bookmark.gif',
                    ),
                    _GifCustomWidget(
                      title: 'bookmark.gif',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/*
 * Класс для отображения .gif
 * внутри метода showDialog
 * */
class _GifCustomWidget extends StatefulWidget {
  final String title;
  const _GifCustomWidget({super.key, required this.title});
  static const double size = 26;

  @override
  State<_GifCustomWidget> createState() => _GifCustomWidgetState();
}

class _GifCustomWidgetState extends State<_GifCustomWidget> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? GifView.asset(
            'assets/gifs/gifs_dark/${widget.title}',
            height: _GifCustomWidget.size,
            width: _GifCustomWidget.size,
            frameRate: 30,
            isAnimated: isActive,
            onFinish: () {
              setState(() {
                isActive = false;
              });
            },
          )
        : GifView.asset(
            'assets/gifs/gifs_light/${widget.title}',
            height: _GifCustomWidget.size,
            width: _GifCustomWidget.size,
            frameRate: 30,
            isAnimated: isActive,
            onFinish: () {
              setState(() {
                isActive = false;
              });
            },
          );
  }
}
