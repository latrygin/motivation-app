part of 'list_forum_bloc.dart';

abstract class ListForumEvent extends Equatable {
  const ListForumEvent();

  @override
  List<Object> get props => [];
}

class InitialNewForumEvent extends ListForumEvent {
  const InitialNewForumEvent();

  @override
  List<Object> get props => [];
}

class InitialPopularForumEvent extends ListForumEvent {
  const InitialPopularForumEvent();

  @override
  List<Object> get props => [];
}

class InitialMyForumEvent extends ListForumEvent {
  const InitialMyForumEvent();

  @override
  List<Object> get props => [];
}

class LoadingNewForumEvent extends ListForumEvent {
  const LoadingNewForumEvent();

  @override
  List<Object> get props => [];
}

class LoadingPopularForumEvent extends ListForumEvent {
  const LoadingPopularForumEvent();

  @override
  List<Object> get props => [];
}

class LoadingMyForumEvent extends ListForumEvent {
  const LoadingMyForumEvent();

  @override
  List<Object> get props => [];
}

class ViewScrollButtonEvent extends ListForumEvent {
  const ViewScrollButtonEvent();

  @override
  List<Object> get props => [];
}
