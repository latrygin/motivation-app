part of 'preloader_bloc.dart';

abstract class PreloaderEvent extends Equatable {
  const PreloaderEvent();

  @override
  List<Object> get props => [];
}

class PreloaderLoadingEvent extends PreloaderEvent {
  const PreloaderLoadingEvent();

  @override
  List<Object> get props => [];
}
