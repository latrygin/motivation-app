// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_forum_bloc.dart';

class CreateForumState extends Equatable {
  final int page;
  const CreateForumState({
    this.page = 0,
  });

  @override
  List<Object> get props => [];

  CreateForumState copyWith({
    int? page,
  }) {
    return CreateForumState(
      page: page ?? this.page,
    );
  }
}
