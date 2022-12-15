import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/widgets/change_theme_button.dart';

import '../../../../assets/icons/svg.dart';
import '../../../../assets/icons/svgs.dart';
import '../registration.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _ThemeButton(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Регистрация',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const _NameInput(),
            const SizedBox(
              height: 24,
            ),
            const _EmailInput(),
            const SizedBox(
              height: 24,
            ),
            const _PasswordInput(),
            const SizedBox(
              height: 24,
            ),
            const _RegistrationButton(),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Или зарегистрироваться\nс помощью',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(child: Divider())
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const _SocialRegister()
          ],
        ),
        const _ToLoginPage()
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.errorName != current.errorName,
      builder: (context, state) {
        return TextField(
          onChanged: (name) => context
              .read<RegistrationBloc>()
              .add(RegistrationNameChanged(name)),
          decoration: InputDecoration(
            hintText: 'Имя',
            errorText: state.errorName == 'null' ? null : state.errorName,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.errorEmail != current.errorEmail,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context
              .read<RegistrationBloc>()
              .add(RegistrationEmailChanged(email)),
          decoration: InputDecoration(
            hintText: 'Электронная почта',
            errorText: state.errorEmail == 'null' ? null : state.errorEmail,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.errorPassword != current.errorPassword ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return TextField(
          onChanged: (password) => context
              .read<RegistrationBloc>()
              .add(RegistrationPasswordChanged(password)),
          obscureText: state.obscureText,
          decoration: InputDecoration(
            hintText: 'Пароль',
            errorText:
                state.errorPassword == 'null' ? null : state.errorPassword,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SVG(
                state.obscureText ? SVGs(context).eye : SVGs(context).eye_slash,
                onPressed: () => context
                    .read<RegistrationBloc>()
                    .add(const RegistrationObscureChanged()),
                size: 10,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  const _RegistrationButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context
              .read<RegistrationBloc>()
              .add(const RegistrationSubmitted()),
          child: Text(
            'Зарегистрироваться',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        );
      },
    );
  }
}

class _SocialRegister extends StatelessWidget {
  const _SocialRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SVG(SVGs.google, size: 40),
        const SizedBox(
          width: 28,
        ),
        SVG(SVGs(context).twitter, size: 40),
        const SizedBox(
          width: 28,
        ),
        SVG(SVGs.facebook, size: 40),
        const SizedBox(
          width: 28,
        ),
        SVG(SVGs.vk, size: 40),
      ],
    );
  }
}

class _ToLoginPage extends StatelessWidget {
  const _ToLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/registration'),
      child: RichText(
        text: TextSpan(
          text: 'Уже есть аккаунт? ',
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
              text: 'Войти',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFA35BFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: ChangingThemeButtonWidget(),
    );
  }
}
