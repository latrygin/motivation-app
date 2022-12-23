import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_forum_event.dart';
part 'create_forum_state.dart';

class CreateForumBloc extends Bloc<CreateForumEvent, CreateForumState> {
  CreateForumBloc() : super(const CreateForumState()) {
    on<CreateForumEvent>((event, emit) {});
    on<ScrollPageEvent>(_onScrollPage);
  }

  void _onScrollPage(
    ScrollPageEvent event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(page: event.page));
    debugPrint(event.page.toString());
  }
}
