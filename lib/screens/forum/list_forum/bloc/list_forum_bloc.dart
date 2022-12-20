import 'dart:async';

import 'package:equatable/equatable.dart';
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
  }

  Future<void> _initialNewForum(
    InitialNewForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    final newForum =
        await _forumServices.getForums(TypeForum.news, state.newPage);
    emit(
      state.copyWith(
        newForums: newForum.forum,
        // newPage: state.newPage + 1,
      ),
    );
  }

  Future<void> _initialPopularForum(
    InitialPopularForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    final popularForum =
        await _forumServices.getForums(TypeForum.popular, state.popularPage);
    emit(
      state.copyWith(
        popularForums: popularForum.forum,
        // popularPage: state.popularPage + 1,
      ),
    );
  }

  Future<void> _initialMyForum(
    InitialMyForumEvent event,
    Emitter<ListForumState> emit,
  ) async {
    final myForum = await _forumServices.getForums(TypeForum.my, state.myPage);
    emit(
      state.copyWith(
        myForums: myForum.forum,
        // myPage: state.myPage + 1,
      ),
    );
  }
}
