import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/widgets/change_theme_button.dart';

import '../reset_password.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  static const title = 'Забыли пароль?';
  static const description =
      'Введите электронную почту, которую Вы указывали при регистрации и мы пришлём Вам новый пароль';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const _Header(),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const _EmailInput(),
            const SizedBox(
              height: 24,
            ),
            const _ResentPasswordButton()
          ],
        ),
        const _SendMailButton()
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SVG(
          SVGs(context).chevrone_left,
          onPressed: () => context.go('/'),
          size: 40,
        ),
        const ChangingThemeButtonWidget()
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.errorEmail != current.errorEmail,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context
              .read<ResetPasswordBloc>()
              .add(ResetPasswordEmailChanged(email)),
          decoration: InputDecoration(
            hintText: 'Электронная почта',
            errorText: state.errorEmail == 'null' ? null : state.errorEmail,
          ),
        );
      },
    );
  }
}

class _ResentPasswordButton extends StatelessWidget {
  const _ResentPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go('/main'),
      //onPressed: () => model.onTapButtonResetPassword(),
      child: Text(
        'Отправить пароль',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class _SendMailButton extends StatelessWidget {
  const _SendMailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) => previous.counter != current.counter,
      builder: (context, state) {
        return InkWell(
          onTap: () =>
              context.read<ResetPasswordBloc>().add(ResetPasswordCounter()),
          child: RichText(
            text: TextSpan(
              text: 'Не пришло письмо? ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: state.counter == 0
                      ? 'Отправить повторно'
                      : 'Подождите ${state.counter} для отправки',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA35BFF),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
