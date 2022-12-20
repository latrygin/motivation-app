import 'package:flutter/material.dart';
import 'package:motivation/screens/statistic/statistic/view/statistic_header.dart';
import 'package:motivation/widgets/search_widget.dart';

import 'statistic_card.dart';

class StatisticBody extends StatelessWidget {
  const StatisticBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderStatistic(),
        const SizedBox(
          height: 24,
        ),
        const SearchWidget(
          title: 'Поиск по приложению',
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CardItemWidget(
              color: Theme.of(context).hoverColor,
              colorsTitle: Theme.of(context).hintColor,
              title: 'Ваше сообщение ждут',
              description: 'Посмотрите кто нуждается в Вашей помощи',
            ),
            const SizedBox(
              width: 20,
            ),
            CardItemWidget(
              color: Theme.of(context).hintColor,
              title: 'Личный дневник',
              description: 'Опишите Ваше состояние на сегодня',
              colorsTitle: Theme.of(context).hoverColor,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CardItemWidget(
              color: Theme.of(context).hintColor,
              title: 'Заметки',
              description:
                  'Планируйте день, чтобы не погрязуть в плохих мыслях',
              colorsTitle: Theme.of(context).hoverColor,
            ),
            const SizedBox(
              width: 20,
            ),
            CardItemWidget(
              color: Theme.of(context).primaryColor,
              colorsTitle: Colors.white,
              title: 'Вредные привычки',
              description: 'Боритесь с вредными привычками вместе с нами',
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}
