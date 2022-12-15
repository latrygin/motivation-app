import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        create: (context) =>
            PreloaderBloc(context)..add(const PreloaderLoadingEvent()),
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
