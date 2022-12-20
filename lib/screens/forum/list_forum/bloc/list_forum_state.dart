// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_forum_bloc.dart';

class ListForumState extends Equatable {
  final List<Forum>? newForums;
  final List<Forum>? popularForums;
  final List<Forum>? myForums;
  final int newPage;
  final int popularPage;
  final int myPage;
  const ListForumState({
    this.newForums,
    this.popularForums,
    this.myForums,
    this.newPage = 0,
    this.popularPage = 0,
    this.myPage = 0,
  });

  @override
  List<Object?> get props => [
        newForums,
        popularForums,
        myForums,
        newPage,
        popularPage,
        myPage,
      ];

  ListForumState copyWith({
    List<Forum>? newForums,
    List<Forum>? popularForums,
    List<Forum>? myForums,
    int? newPage,
    int? popularPage,
    int? myPage,
  }) {
    return ListForumState(
      newForums: newForums ?? this.newForums,
      popularForums: popularForums ?? this.popularForums,
      myForums: myForums ?? this.myForums,
      newPage: newPage ?? this.newPage,
      popularPage: popularPage ?? this.popularPage,
      myPage: myPage ?? this.myPage,
    );
  }
}
