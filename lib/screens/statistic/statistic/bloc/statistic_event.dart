part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class StatisticSearchChanged extends StatisticEvent {
  final String search;
  const StatisticSearchChanged(this.search);

  @override
  List<Object> get props => [search];
}

class StatisticInitial extends StatisticEvent {
  const StatisticInitial();

  @override
  List<Object> get props => [];
}
