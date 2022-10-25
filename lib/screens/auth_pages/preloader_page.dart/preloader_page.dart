import 'package:flutter/material.dart';
import 'package:motivation/screens/auth_pages/preloader_page.dart/preloader_page_view_model.dart';
import 'package:motivation/widgets/frame.dart';
import 'package:provider/provider.dart';

class PreloaderScreen extends StatelessWidget {
  const PreloaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => PreloaderPageViewModel(context: context),
        child: const FrameWidget(child: _PreloaderBodyWidget()),
      );
}

class _PreloaderBodyWidget extends StatelessWidget {
  const _PreloaderBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PreloaderPageViewModel>();
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
