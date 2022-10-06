import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/screens/pin_code_page/pin_code_page_view_model.dart';
import 'package:motivation/widgets/frame.dart';

import '../../assets/icons/svgs.dart';
import '../../assets/themes/change_theme.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => PinCodePageViewModel(),
        child: const FrameWidget(child: _PinCodeBodyWidget()),
      );
}

class _PinCodeBodyWidget extends StatelessWidget {
  const _PinCodeBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<PinCodePageViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const _ChangingThemeButtonWidget(),
            const SizedBox(
              height: 24,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Введите пин-код',
                    style: Theme.of(context).textTheme.headlineLarge)),
            const SizedBox(
              height: 24,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'На Вашу почту было отправлено письмо с кодом подтверждения',
                    style: Theme.of(context).textTheme.headlineSmall)),
            const SizedBox(
              height: 24,
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 80,
                fieldWidth: 60,
                selectedFillColor: Theme.of(context).hintColor,
                selectedColor: Theme.of(context).primaryColor,
                activeFillColor: Theme.of(context).cardColor,
                activeColor: Theme.of(context).hintColor,
                inactiveFillColor: Theme.of(context).cardColor,
                inactiveColor: Theme.of(context).hintColor,
              ),
              animationDuration: const Duration(milliseconds: 200),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: model.pinCode,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Отправить код',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: InkWell(
            onTap: () => model.repeadSendEmailMessage(),
            child: RichText(
              text: TextSpan(
                text: 'Не пришло письмо? ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Отправить повторно',
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

class _ChangingThemeButtonWidget extends StatelessWidget {
  const _ChangingThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SVG(
                Theme.of(context).brightness == Brightness.dark
                    ? SVGs.chevrone_left_light
                    : SVGs.chevrone_left_dark,
                onPressed: () => context.go('/registration'),
                size: 36,
              ),
              Consumer<ThemeModel>(
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
              )
            ],
          )),
    );
  }
}
