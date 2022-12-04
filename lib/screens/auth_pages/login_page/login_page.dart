import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/screens/auth_pages/login_page/login_page_view_model.dart';
import 'package:motivation/widgets/change_theme_button.dart';
import 'package:motivation/widgets/frame.dart';
import 'package:provider/provider.dart';

import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => LoginPageViewModel(),
        child: const FrameWidget(child: _LoginBodyWidget()),
      );
}

class _LoginBodyWidget extends StatelessWidget {
  const _LoginBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginPageViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _HeaderWidget(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Войти',
                      style: Theme.of(context).textTheme.headlineLarge)),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: model.email,
                style: Theme.of(context).textTheme.labelLarge,
                onChanged: (value) => model.resetErrorEmail(),
                decoration: InputDecoration(
                    hintText: 'Электронная почта', errorText: model.errorEmail),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                  controller: model.password,
                  obscureText: model.obscure,
                  style: Theme.of(context).textTheme.labelLarge,
                  onChanged: (value) => model.resetErrorPassword(),
                  decoration: InputDecoration(
                      hintText: 'Пароль',
                      errorText: model.errorPassword,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SVG(
                          model.obscure
                              ? SVGs(context).eye
                              : SVGs(context).eye_slash,
                          onPressed: () => model.changeObscureValue(),
                          size: 12,
                        ),
                      ))),
              const SizedBox(
                height: 24,
              ),
              const _LogInButtonWidget(),
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
              Row(
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
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: InkWell(
            onTap: () => context.go('/registration'),
            child: RichText(
              text: TextSpan(
                text: 'Нет аккаунта? ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Зарегистрируйся',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA35BFF))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LogInButtonWidget extends StatefulWidget {
  const _LogInButtonWidget({Key? key}) : super(key: key);

  @override
  State<_LogInButtonWidget> createState() => _LogInButtonWidgetState();
}

class _LogInButtonWidgetState extends State<_LogInButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginPageViewModel>();
    return ElevatedButton(
        onPressed: () => model.onTapButtonLogin(context, mounted),
        child: model.isActiveButton
            ? Text(
                'Войти',
                style: Theme.of(context).textTheme.labelMedium,
              )
            : CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor,
              ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: ChangingThemeButtonWidget()),
    );
  }
}
