import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(const StatisticState()) {
    on<StatisticSearchChanged>(_onSearchChanged);
    on<StatisticInitial>(_initialState);
  }

  void _onSearchChanged(
    StatisticSearchChanged event,
    Emitter<StatisticState> emit,
  ) {
    //some code
  }

  FutureOr<void> _initialState(
    StatisticInitial event,
    Emitter<StatisticState> emit,
  ) {
    //some code
  }
}
