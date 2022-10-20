import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/screens/auth_pages/registration_page/registration_page_view_model.dart';
import 'package:motivation/widgets/change_theme_button.dart';
import 'package:motivation/widgets/frame.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => RegistrationPageViewModel(),
      child: const FrameWidget(child: _RegistrationBodyWidget()));
}

class _RegistrationBodyWidget extends StatelessWidget {
  const _RegistrationBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistrationPageViewModel>();
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
                  child: Text('Регистрация',
                      style: Theme.of(context).textTheme.headlineLarge)),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: model.name,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                    hintText: 'Имя', errorText: model.errorName),
                onChanged: (value) => model.resetErrorName(),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: model.email,
                scrollPadding: const EdgeInsets.all(0),
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                    hintText: 'Электронная почта', errorText: model.errorEmail),
                onChanged: (value) => model.resetErrorEmail(),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: model.password,
                obscureText: model.obscure,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                    errorText: model.errorPassword,
                    hintText: 'Пароль',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SVG(
                        model.obscure
                            ? Theme.of(context).brightness == Brightness.dark
                                ? SVGs.eye_light
                                : SVGs.eye_dark
                            : Theme.of(context).brightness == Brightness.dark
                                ? SVGs.eye_slash_light
                                : SVGs.eye_slash_dark,
                        onPressed: () => model.changeObscureValue(),
                        size: 12,
                      ),
                    )),
                onChanged: (value) => model.resetErrorPassword(),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () => context.go('/registration/pincode'),
                //onPressed: () => model.onTapButtonRegistration(),
                child: Text(
                  'Зарегистрироваться',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
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
                  SVG(SVGs.twitter, size: 40),
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
            onTap: () => context.go('/'),
            child: RichText(
              text: TextSpan(
                text: 'Есть аккаунта? ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Войти',
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
