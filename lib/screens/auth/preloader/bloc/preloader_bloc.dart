// ignore_for_file: inference_failure_on_instance_creation, use_build_context_synchronously

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends Bloc<PreloaderEvent, PreloaderState> {
  final BuildContext context;
  PreloaderBloc(this.context) : super(PreloaderInitial()) {
    on<PreloaderLoadingEvent>(_onLoadingPage);
  }

  Future<void> _onLoadingPage(
    PreloaderLoadingEvent event,
    Emitter<PreloaderState> emit,
  ) async {
    context.go('/login');
  }
}
