// ignore_for_file: inference_failure_on_instance_creation, use_build_context_synchronously

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/provider/user_provider.dart';
import 'package:motivation/domain/services/user_services.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends Bloc<PreloaderEvent, PreloaderState> {
  final _userServices = UserServices();
  final _userProvider = UserProvider();
  PreloaderBloc() : super(const PreloaderState()) {
    on<PreloaderLoadingEvent>(_onLoadingPage);
  }

  Future<void> _onLoadingPage(
    PreloaderLoadingEvent event,
    Emitter<PreloaderState> emit,
  ) async {
    final user = await _userProvider.getUser();
    if (user != null) {
      final newUser = await _userServices.login(
        user.email,
        user.password ?? '',
      );
      await _userProvider.setUser(newUser);
      emit(state.copyWith(status: AuthStatus.authentificated));
    } else {
      emit(state.copyWith(status: AuthStatus.unknown));
    }
  }
}
