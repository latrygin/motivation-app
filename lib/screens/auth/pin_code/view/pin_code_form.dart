import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/widgets/change_theme_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../bloc/pin_code_bloc.dart';

class PinCodeForm extends StatelessWidget {
  const PinCodeForm({super.key});

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
                'Введите пин-код',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'На Вашу почту было отправлено письмо с кодом подтверждения',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const _PinCodeInput(),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () => context.go('/registration'),
              child: Text(
                'Отправить код',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        const _SendingMessageWidget(),
      ],
    );
  }
}

class _PinCodeInput extends StatelessWidget {
  const _PinCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCodeBloc, PinCodeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return PinCodeTextField(
          appContext: context,
          length: 4,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 80,
            fieldWidth: 60,
            selectedFillColor: Theme.of(context).hintColor,
            selectedColor: Theme.of(context).primaryColor,
            activeFillColor: Theme.of(context).cardColor,
            activeColor: state.status == PinCodeStatus.incorrect
                ? Colors.red
                : Theme.of(context).hintColor,
            inactiveFillColor: Theme.of(context).cardColor,
            inactiveColor: Theme.of(context).hintColor,
          ),
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          onCompleted: (pinCode) =>
              context.read<PinCodeBloc>().add(PinCodeSubmitted(pinCode)),
          onChanged: (pinCode) =>
              context.read<PinCodeBloc>().add(const PinCodeChanged()),
        );
      },
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
          onPressed: () => context.go('/registration'),
          size: 40,
        ),
        const ChangingThemeButtonWidget()
      ],
    );
  }
}

class _SendingMessageWidget extends StatelessWidget {
  const _SendingMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: () => model.sendMessageRepeat(),
      child: RichText(
        text: TextSpan(
          text: 'Не пришло письмо? ',
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
              text: 'model.durationSendMessage',
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
