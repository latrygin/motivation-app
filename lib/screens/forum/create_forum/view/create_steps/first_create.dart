// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/create_forum_bloc.dart';

class FirstForumPage extends StatelessWidget {
  const FirstForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 24.0, right: 24.0),
      child: Column(
        children: [
          Text(
            'Создание нового вопроса',
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
          const _InputTitle(),
          const SizedBox(
            height: 24,
          ),
          const _SwitchAnonimWidget(),
          const _SwitchActiveWidget(),
        ],
      ),
    );
  }
}

class _InputTitle extends StatelessWidget {
  const _InputTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateForumBloc, CreateForumState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title,
          onChanged: (title) =>
              context.read<CreateForumBloc>().add(ForumTitleChanged(title)),
          decoration: const InputDecoration(
            hintText: 'Вопрос',
          ),
        );
      },
    );
  }
}

class _SwitchAnonimWidget extends StatelessWidget {
  const _SwitchAnonimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Хотите сделать пост анонимным?',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        BlocBuilder<CreateForumBloc, CreateForumState>(
          buildWhen: (previous, current) =>
              previous.is_anonymous != current.is_anonymous,
          builder: (context, state) {
            return Switch(
              value: state.is_anonymous,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (is_anonymous) => context
                  .read<CreateForumBloc>()
                  .add(ForumIsAnonymousChanged(is_anonymous)),
            );
          },
        ),
      ],
    );
  }
}

class _SwitchActiveWidget extends StatelessWidget {
  const _SwitchActiveWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Хотите опубликовать пост сразу после редактирования?',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        BlocBuilder<CreateForumBloc, CreateForumState>(
          buildWhen: (previous, current) =>
              previous.is_active != current.is_active,
          builder: (context, state) {
            return Switch(
              value: state.is_active,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (is_active) => context
                  .read<CreateForumBloc>()
                  .add(ForumIsActiveChanged(is_active)),
            );
          },
        ),
      ],
    );
  }
}
