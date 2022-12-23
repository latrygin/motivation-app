// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ThirdForumPage extends StatelessWidget {
  const ThirdForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 24.0, right: 24.0),
      child: Column(
        children: [
          Text(
            'Опишите проблему подробнее',
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
          const TextField(
            // onChanged: (name) => context
            //     .read<RegistrationBloc>()
            //     .add(RegistrationNameChanged(name)),
            maxLines: 16,
            decoration: InputDecoration(
              hintText: 'Описание вопроса',
              //errorText: state.errorName == 'null' ? null : state.errorName,
            ),
          ),
        ],
      ),
    );
  }
}
