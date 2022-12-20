import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/provider/user_provider.dart';
import 'package:motivation/domain/services/user_services.dart';

import '../../../../widgets/wrapper.dart';
import '../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: const EdgeInsets.all(20),
      child: BlocProvider(
        create: (context) => LoginBloc(
          userServices: UserServices(),
          userProvider: UserProvider(),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isAuth) context.go('/main');
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
