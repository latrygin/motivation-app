part of 'create_forum_bloc.dart';

abstract class CreateForumEvent extends Equatable {
  const CreateForumEvent();

  @override
  List<Object> get props => [];
}

class ScrollPageEvent extends CreateForumEvent {
  final int page;
  const ScrollPageEvent(this.page);

  @override
  List<Object> get props => [page];
}
