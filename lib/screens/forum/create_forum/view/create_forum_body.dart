import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import '../bloc/create_forum_bloc.dart';
import 'create_steps/first_create.dart';
import 'create_steps/fourth_create.dart';
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

  static const List<Widget> _listPages = [
    FirstForumPage(),
    SecondForumPage(),
    ThirdForumPage(),
    FourthForumPage(),
  ];

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
          physics: const NeverScrollableScrollPhysics(),
          children: _listPages,
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
              } else {
                context.go('/main');
              }
            },
          ),
        ),
        BlocBuilder<CreateForumBloc, CreateForumState>(
          buildWhen: (previous, current) =>
              previous.gallaryIsOpen != current.gallaryIsOpen,
          builder: (context, state) {
            return state.gallaryIsOpen
                ? const SizedBox()
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        bottom: 48,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_selectedIndex != _listPages.length - 1) {
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
                  );
          },
        ),
      ],
    );
  }
}
