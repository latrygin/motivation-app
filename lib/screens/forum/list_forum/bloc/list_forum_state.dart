// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_forum_bloc.dart';

class ListForumState extends Equatable {
  final List<Forum>? newForums;
  final List<Forum>? popularForums;
  final List<Forum>? myForums;
  final int newPage;
  final int popularPage;
  final int myPage;
  final NewForumStatus newStatus;
  final PopularForumStatus popularStatus;
  final MyForumStatus myStatus;

  const ListForumState({
    this.newForums,
    this.popularForums,
    this.myForums,
    this.newPage = 0,
    this.popularPage = 0,
    this.myPage = 0,
    this.newStatus = NewForumStatus.notEnd,
    this.popularStatus = PopularForumStatus.notEnd,
    this.myStatus = MyForumStatus.notEnd,
  });

  @override
  List<Object?> get props => [
        newForums,
        popularForums,
        myForums,
        newPage,
        popularPage,
        myPage,
        newStatus,
        popularStatus,
        myStatus,
      ];

  ListForumState copyWith({
    List<Forum>? newForums,
    List<Forum>? popularForums,
    List<Forum>? myForums,
    int? newPage,
    int? popularPage,
    int? myPage,
    NewForumStatus? newStatus,
    PopularForumStatus? popularStatus,
    MyForumStatus? myStatus,
  }) {
    return ListForumState(
      newForums: newForums ?? this.newForums,
      popularForums: popularForums ?? this.popularForums,
      myForums: myForums ?? this.myForums,
      newPage: newPage ?? this.newPage,
      popularPage: popularPage ?? this.popularPage,
      myPage: myPage ?? this.myPage,
      newStatus: newStatus ?? this.newStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      myStatus: myStatus ?? this.myStatus,
    );
  }
}

enum NewForumStatus { notEnd, end }

enum PopularForumStatus { notEnd, end }

enum MyForumStatus { notEnd, end }
