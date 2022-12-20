import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivation/domain/provider/user_provider.dart';
import 'package:motivation/domain/services/user_services.dart';
import 'package:motivation/widgets/wrapper.dart';

import '../preloader.dart';

class PreloaderPage extends StatelessWidget {
  const PreloaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      padding: const EdgeInsets.all(20),
      child: BlocProvider(
        lazy: false,
        create: (_) => PreloaderBloc(
          userServices: UserServices(),
          userProvider: UserProvider(),
        )..add(const PreloaderLoadingEvent()),
        child: BlocListener<PreloaderBloc, PreloaderState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authentificated) {
              context.go('/main');
            } else {
              context.go('/login');
            }
          },
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
