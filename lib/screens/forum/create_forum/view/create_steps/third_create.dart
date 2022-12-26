// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/create_forum/bloc/create_forum_bloc.dart';

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
          const _InputBody(),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: BlocBuilder<CreateForumBloc, CreateForumState>(
              builder: (context, state) {
                return Text(
                  '0/10000',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _InputBody extends StatelessWidget {
  const _InputBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateForumBloc, CreateForumState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.body,
          onChanged: (body) =>
              context.read<CreateForumBloc>().add(ForumBodyChanged(body)),
          maxLines: 16,
          decoration: const InputDecoration(
            hintText: 'Описание вопроса',
            //errorText: 'Минимум 100 символов',
          ),
        );
      },
    );
  }
}
