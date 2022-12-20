// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preloader_bloc.dart';

class PreloaderState extends Equatable {
  final AuthStatus status;
  const PreloaderState({this.status = AuthStatus.unauthentificated});

  @override
  List<Object> get props => [];

  PreloaderState copyWith({
    AuthStatus? status,
  }) {
    return PreloaderState(
      status: status ?? this.status,
    );
  }
}

enum AuthStatus { unknown, authentificated, unauthentificated }
