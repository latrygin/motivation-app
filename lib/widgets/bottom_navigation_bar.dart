import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/screens/chat/view/chat_page.dart';
import 'package:motivation/screens/profile_page/profile_page.dart';
import 'package:motivation/screens/statistic/statistic/statistic.dart';
import '../screens/blog_page/blog_page.dart';
import 'wrapper.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static const double sizeicons = 28;

  static const List<Widget> _widgetOptions = <Widget>[
    StatisticPage(),
    ChatPage(),
    Text('data'),
    //ForumScreen(),
    BlogScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    debugPrint(index.toString());
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      backgroundColor: _selectedIndex == 0 || _selectedIndex == 4
          ? Theme.of(context).hintColor
          : Colors.transparent,
      bottom: false,
      child: SizedBox(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).hintColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SVG(
              SVGs(context).unactive_statistic,
              size: sizeicons,
            ),
            activeIcon: SVG(
              SVGs(context).statistic,
              size: sizeicons,
            ),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: SVG(
              SVGs(context).unactive_message,
              size: sizeicons,
            ),
            activeIcon: SVG(
              SVGs(context).message,
              size: sizeicons,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SVG(
              SVGs(context).unactive_edit,
              size: sizeicons,
            ),
            activeIcon: SVG(
              SVGs(context).edit,
              size: sizeicons,
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: SVG(
              SVGs(context).unactive_document,
              size: sizeicons,
            ),
            activeIcon: SVG(
              SVGs(context).document,
              size: sizeicons,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: SVG(
              SVGs(context).unactive_user,
              size: sizeicons,
            ),
            activeIcon: SVG(
              SVGs(context).user,
              size: sizeicons,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 12),
        unselectedLabelStyle:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 12),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
