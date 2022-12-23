// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

class SecondForumPage extends StatelessWidget {
  const SecondForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 24.0, right: 24.0),
      child: Column(
        children: [
          Text(
            'Выберите тему вопроса',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Введите сам вопрос в поле ниже, а на следующем шаге опишите проблему',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 24,
          ),
          const _ChipListWidget(),
        ],
      ),
    );
  }
}

class _ChipListWidget extends StatelessWidget {
  const _ChipListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ChipList(
        listOfChipNames: const [
          'item 1',
          'item 2',
          'item 3',
          'item 4',
          'item 5',
          'item 6',
          'item 7',
          'item 8',
          'item 9',
          'item 10',
          'item 11',
          'item 12',
          'item 13',
          'item 14',
          'item 15',

          // 'Друзья',
          // 'Отношения',
          // 'Семья',
          // 'Девушка',
          // 'Парень',
          // 'Зависимость',
          // 'Курение',
          // 'История',
          // 'Наркотики',
          // 'Общение',
          // 'Паника',
          // 'Другое',
        ],
        activeBgColorList: [Theme.of(context).primaryColor],
        inactiveBgColorList: [Theme.of(context).hintColor.withOpacity(0.5)],
        inactiveBorderColorList: [Theme.of(context).hintColor],
        borderRadiiList: [50],
        inactiveTextColorList: [Theme.of(context).hoverColor],
        listOfChipIndicesCurrentlySeclected: [0],
        shouldWrap: true,
        runSpacing: 10,
        spacing: 10,
      ),
    );
  }
}
