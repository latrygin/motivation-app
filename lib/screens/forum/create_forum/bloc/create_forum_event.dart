// ignore_for_file: non_constant_identifier_names

part of 'create_forum_bloc.dart';

abstract class CreateForumEvent extends Equatable {
  const CreateForumEvent();

  @override
  List<Object> get props => [];
}

class ForumTitleChanged extends CreateForumEvent {
  const ForumTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class ForumIsAnonymousChanged extends CreateForumEvent {
  const ForumIsAnonymousChanged(this.is_anonymous);

  final bool is_anonymous;

  @override
  List<Object> get props => [is_anonymous];
}

class ForumIsActiveChanged extends CreateForumEvent {
  const ForumIsActiveChanged(this.is_active);

  final bool is_active;

  @override
  List<Object> get props => [is_active];
}

class ForumThemeChanged extends CreateForumEvent {
  const ForumThemeChanged(this.theme);

  final int theme;

  @override
  List<Object> get props => [theme];
}

class ForumBodyChanged extends CreateForumEvent {
  const ForumBodyChanged(this.body);

  final String body;

  @override
  List<Object> get props => [body];
}

class ForumOpenGallary extends CreateForumEvent {
  const ForumOpenGallary();

  @override
  List<Object> get props => [];
}

class ForumInitialGallary extends CreateForumEvent {
  const ForumInitialGallary();

  @override
  List<Object> get props => [];
}
