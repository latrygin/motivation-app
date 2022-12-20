// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  final String username;
  final String email;
  final String search;

  const StatisticState({
    this.username = 'undefine',
    this.email = 'undefine',
    this.search = '',
  });

  @override
  List<Object> get props => [username, email, search];

  StatisticState copyWith({
    String? username,
    String? email,
    String? search,
  }) {
    return StatisticState(
      username: username ?? this.username,
      email: email ?? this.email,
      search: search ?? this.search,
    );
  }

  @override
  bool get stringify => true;
}
