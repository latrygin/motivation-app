import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                minRadius: 36,
                maxRadius: 36,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: SVG(
                  SVGs(context).unactive_user,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Латрыгин Арсений',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Пытаю побороть зависимость с курением',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Друзья'),
                    Text(
                      '241',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Диалогов'),
                    Text(
                      '1032',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Помощи'),
                    Text(
                      '241',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => debugPrint('Нажата кнопка'),
                child: const Text(
                  'Подписаться',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size((MediaQuery.of(context).size.width - 72) / 2, 40),
                ),
              ),
              ElevatedButton(
                onPressed: () => debugPrint('Нажата кнопка'),
                child: const Text(
                  'Подписаться',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size((MediaQuery.of(context).size.width - 72) / 2, 40),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
