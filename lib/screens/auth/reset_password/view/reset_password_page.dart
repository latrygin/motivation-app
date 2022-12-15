import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/widgets/wrapper.dart';

import '../bloc/reset_password_bloc.dart';
import 'reset_password_form.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: const EdgeInsets.all(20),
      child: BlocProvider(
        create: (context) => ResetPasswordBloc()..add(ResetPasswordCounter()),
        child: const ResetPasswordForm(),
      ),
    );
  }
}
