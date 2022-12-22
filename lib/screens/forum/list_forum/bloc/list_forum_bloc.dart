// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/entity/forum/forum.dart';
import 'package:motivation/domain/services/forum_services.dart';

part 'list_forum_event.dart';
part 'list_forum_state.dart';

class ListForumBloc extends Bloc<ListForumEvent, ListForumState> {
  final ForumServices _forumServices;
  ListForumBloc({
    required ForumServices forumServices,
  })  : _forumServices = forumServices,
        super(const ListForumState()) {
    on<InitialNewForumEvent>(_initialNewForum);
    on<InitialPopularForumEvent>(_initialPopularForum);
    on<InitialMyForumEvent>(_initialMyForum);
    on<LoadingNewForumEvent>(_loadingNewForumEvent);
    on<LoadingPopularForumEvent>(_loadingPopularForumEvent);
    on<LoadingMyForumEvent>(_loadingMyForumEvent);
  }

  Future<void> _initialNewForum(
    InitialNewForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    try {
      final newForum = await _forumServices.getForums(
        TypeForum.news,
        0,
      );
      emit(
        state.copyWith(
          newForums: newForum.forum,
          newStatus: NewForumStatus.notEnd,
          newPage: 0,
        ),
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> _initialPopularForum(
    InitialPopularForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    final popularForum = await _forumServices.getForums(
      TypeForum.popular,
      0,
    );
    emit(
      state.copyWith(
        popularForums: popularForum.forum,
        popularStatus: PopularForumStatus.notEnd,
        popularPage: 0,
      ),
    );
  }

  Future<void> _initialMyForum(
    InitialMyForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    final myForum = await _forumServices.getForums(
      TypeForum.my,
      0,
    );
    emit(
      state.copyWith(
        myForums: myForum.forum,
        myStatus: MyForumStatus.notEnd,
        myPage: 0,
      ),
    );
  }

  Future<void> _loadingNewForumEvent(
    LoadingNewForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    try {
      final newPageForum = await _forumServices.getForums(
        TypeForum.news,
        state.newPage + 1,
      );
      final allPages = state.newForums;
      allPages?.addAll(newPageForum.forum);
      emit(
        state.copyWith(
          newForums: allPages,
          newPage: state.newPage + 1,
          newStatus: newPageForum.forum.length < 5 ? NewForumStatus.end : null,
        ),
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> _loadingPopularForumEvent(
    LoadingPopularForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    try {
      final popularPageForum = await _forumServices.getForums(
        TypeForum.popular,
        state.popularPage + 1,
      );
      final allPages = state.popularForums;
      allPages?.addAll(popularPageForum.forum);
      emit(
        state.copyWith(
          popularForums: allPages,
          popularPage: state.popularPage + 1,
          popularStatus:
              popularPageForum.forum.length < 5 ? PopularForumStatus.end : null,
        ),
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  FutureOr<void> _loadingMyForumEvent(
    LoadingMyForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    try {
      final myPageForum = await _forumServices.getForums(
        TypeForum.my,
        state.myPage + 1,
      );
      final allPages = state.myForums;
      allPages?.addAll(myPageForum.forum);
      emit(
        state.copyWith(
          myForums: allPages,
          myPage: state.myPage + 1,
          myStatus: myPageForum.forum.length < 5 ? MyForumStatus.end : null,
        ),
      );
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
