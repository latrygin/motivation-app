import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/wrapper.dart';
import '../bloc/registration_bloc.dart';
import 'registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: const EdgeInsets.all(20),
      child: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: const RegistrationForm(),
      ),
    );
  }
}
