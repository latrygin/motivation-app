import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/widgets/wrapper.dart';

import '../pin_code.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: const EdgeInsets.all(20),
      child: BlocProvider(
        create: (context) => PinCodeBloc(),
        child: const PinCodeForm(),
      ),
    );
  }
}
