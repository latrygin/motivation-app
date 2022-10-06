import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/screens/reset_password_page/reset_password_page_view_model.dart';
import 'package:motivation/widgets/frame.dart';
import 'package:provider/provider.dart';
import '../../assets/icons/svgs.dart';
import '../../assets/themes/change_theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ResetPasswordPageViewModel(),
        child: const FrameWidget(child: _ResetPasswordBodyWidget()),
      );
}

class _ResetPasswordBodyWidget extends StatelessWidget {
  const _ResetPasswordBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ResetPasswordPageViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _ChangingThemeButtonWidget(),
              const SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Забыли пароль?',
                      style: Theme.of(context).textTheme.headlineLarge)),
              const SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Введите электронную почту, которую Вы указывали при регистрации и мы пришлём Вам новый пароль',
                      style: Theme.of(context).textTheme.headlineSmall)),
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
              ElevatedButton(
                onPressed: () => model.onTapButtonResetPassword(),
                child: Text(
                  'Отправить пароль',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: InkWell(
            onTap: () => model.sendMessageRepeat(),
            child: RichText(
              text: TextSpan(
                text: 'Не пришло письмо? ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: model.durationSendMessage,
                      style: const TextStyle(
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

class _ChangingThemeButtonWidget extends StatelessWidget {
  const _ChangingThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
              return SVG(
                Theme.of(context).brightness == Brightness.dark
                    ? SVGs.sun
                    : SVGs.moon,
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
                size: 36,
              );
            },
          )),
    );
  }
}
