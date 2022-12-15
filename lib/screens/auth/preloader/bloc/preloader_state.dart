part of 'preloader_bloc.dart';

abstract class PreloaderState extends Equatable {
  const PreloaderState();
  
  @override
  List<Object> get props => [];
}

class PreloaderInitial extends PreloaderState {}
