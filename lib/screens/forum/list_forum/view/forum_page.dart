import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/services/forum_services.dart';

import '../bloc/list_forum_bloc.dart';
import 'forum_body.dart';

class ListForumPage extends StatelessWidget {
  const ListForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListForumBloc(
        forumServices: ForumServices(),
      )..add(const InitialNewForumEvent()),
      child: const ListForumBody(),
    );
  }
}
