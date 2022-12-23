import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'create_steps/first_create.dart';
import 'create_steps/second_create.dart';
import 'create_steps/third_create.dart';

class CreateForumBody extends StatefulWidget {
  const CreateForumBody({super.key});

  @override
  State<CreateForumBody> createState() => _CreateForumBodyState();
}

class _CreateForumBodyState extends State<CreateForumBody> {
  var _selectedIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          children: const [
            FirstForumPage(),
            SecondForumPage(),
            ThirdForumPage(),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SVG(
            SVGs(context).chevron_left,
            size: 54,
            onPressed: () {
              if (_selectedIndex != 0) {
                setState(() {
                  _selectedIndex = _selectedIndex - 1;
                  _controller.animateToPage(
                    _selectedIndex,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedIndex != 2) {
                  setState(() {
                    _selectedIndex = _selectedIndex + 1;
                    _controller.animateToPage(
                      _selectedIndex,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              child: Text(
                'Далее',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
