import 'package:flutter/material.dart';

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
          const TextField(
            // onChanged: (name) => context
            //     .read<RegistrationBloc>()
            //     .add(RegistrationNameChanged(name)),

            decoration: InputDecoration(
              hintText: 'Вопрос',
              //errorText: state.errorName == 'null' ? null : state.errorName,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const SwitchAnonimWidget(),
          const SwitchActiveWidget(),
        ],
      ),
    );
  }
}

class SwitchAnonimWidget extends StatefulWidget {
  const SwitchAnonimWidget({super.key});

  @override
  State<SwitchAnonimWidget> createState() => _SwitchAnonimWidgetState();
}

class _SwitchAnonimWidgetState extends State<SwitchAnonimWidget> {
  bool light = false;
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
        Switch(
          value: light,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            setState(() {
              light = value;
            });
          },
        ),
      ],
    );
  }
}

class SwitchActiveWidget extends StatefulWidget {
  const SwitchActiveWidget({super.key});

  @override
  State<SwitchActiveWidget> createState() => _SwitchActiveWidgetState();
}

class _SwitchActiveWidgetState extends State<SwitchActiveWidget> {
  bool light = false;
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
        Switch(
          value: light,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            setState(() {
              light = value;
            });
          },
        ),
      ],
    );
  }
}
