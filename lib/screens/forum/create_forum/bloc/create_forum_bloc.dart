import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
part 'create_forum_event.dart';
part 'create_forum_state.dart';

class CreateForumBloc extends Bloc<CreateForumEvent, CreateForumState> {
  CreateForumBloc() : super(const CreateForumState()) {
    on<CreateForumEvent>((event, emit) {});
    on<ForumTitleChanged>(_forumTitleChanged);
    on<ForumIsAnonymousChanged>(_forumIsAnonymousChanged);
    on<ForumIsActiveChanged>(_forumIsActiveChanged);
    on<ForumThemeChanged>(_forumThemeChanged);
    on<ForumBodyChanged>(_forumBodyChanged);
    on<ForumOpenGallary>(_forumOpenGallary);
  }

  void _forumTitleChanged(
    ForumTitleChanged event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _forumIsAnonymousChanged(
    ForumIsAnonymousChanged event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(is_anonymous: event.is_anonymous));
  }

  void _forumIsActiveChanged(
    ForumIsActiveChanged event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(is_active: event.is_active));
  }

  void _forumThemeChanged(
    ForumThemeChanged event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(theme: event.theme));
  }

  void _forumBodyChanged(
    ForumBodyChanged event,
    Emitter<CreateForumState> emit,
  ) {
    emit(state.copyWith(body: event.body));
  }

  Future<void> _forumOpenGallary(
    ForumOpenGallary event,
    Emitter<CreateForumState> emit,
  ) async {
    final permitted = await PhotoManager.requestPermissionExtend();
    if (permitted.isAuth) {
      emit(state.copyWith());
      final albums = await PhotoManager.getAssetPathList(onlyAll: true);
      final recentAlbum = albums.first;

      // Now that we got the album, fetch all the assets it contains
      final recentAssets = await recentAlbum.getAssetListRange(
        start: 0, // start at index 0
        end: 1000000, // end at a very big index (to get all the assets)
      );
      var newByteList = <Uint8List?>[];

      recentAssets.forEach((value) async {
        final index = await value.thumbnailData;
        newByteList.add(index);
      });

      emit(
        state.copyWith(
          gallaryIsOpen: !state.gallaryIsOpen,
          photosFromGallary: newByteList,
        ),
      );
    }
  }
}
