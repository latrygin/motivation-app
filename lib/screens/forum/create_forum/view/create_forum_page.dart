import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/screens/forum/create_forum/bloc/create_forum_bloc.dart';
import 'package:motivation/widgets/wrapper.dart';

import 'create_forum_body.dart';

class CreateForumPage extends StatelessWidget {
  const CreateForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      bottom: false,
      child: BlocProvider(
        create: (context) => CreateForumBloc(),
        child: const CreateForumBody(),
      ),
    );
  }
}
