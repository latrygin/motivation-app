import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/widgets/wrapper.dart';

import '../bloc/statistic_bloc.dart';
import 'statistic_body.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticBloc(),
      child: const StatisticBody(),
    );
  }
}
