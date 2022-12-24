// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
part of 'create_forum_bloc.dart';

class CreateForumState extends Equatable {
  final int page;
  final String title;
  final bool is_anonymous;
  final bool is_active;
  final int theme;
  final String body;
  final bool gallaryIsOpen;
  final List<AssetEntity>? photosFromGallary;
  const CreateForumState({
    this.page = 0,
    this.title = '',
    this.is_anonymous = false,
    this.is_active = false,
    this.theme = 0,
    this.body = '',
    this.gallaryIsOpen = false,
    this.photosFromGallary,
  });

  @override
  List<Object?> get props => [
        page,
        title,
        is_anonymous,
        is_active,
        theme,
        body,
        gallaryIsOpen,
        photosFromGallary,
      ];

  CreateForumState copyWith({
    int? page,
    String? title,
    bool? is_anonymous,
    bool? is_active,
    int? theme,
    String? body,
    bool? gallaryIsOpen,
    List<AssetEntity>? photosFromGallary,
  }) {
    return CreateForumState(
      page: page ?? this.page,
      title: title ?? this.title,
      is_anonymous: is_anonymous ?? this.is_anonymous,
      is_active: is_active ?? this.is_active,
      theme: theme ?? this.theme,
      body: body ?? this.body,
      gallaryIsOpen: gallaryIsOpen ?? this.gallaryIsOpen,
      photosFromGallary: photosFromGallary ?? this.photosFromGallary,
    );
  }
}
