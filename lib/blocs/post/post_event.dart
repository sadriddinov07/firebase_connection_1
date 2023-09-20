part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostCreateEvent extends PostEvent {
  final String title;
  final String content;
  final bool isPublic;

  const PostCreateEvent({
    required this.title,
    required this.content,
    required this.isPublic,
  });

  @override
  List<Object> get props => [
        title,
        content,
        isPublic,
      ];
}

class PostDeleteEvent extends PostEvent {
  final String id;

  const PostDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class PostUpdateEvent extends PostEvent {
  final String id;
  final String? title;
  final String? content;
  final bool? isPublic;

  const PostUpdateEvent({
    required this.id,
    this.title,
    this.content,
    this.isPublic,
  });

  @override
  List<Object> get props => [id];
}

class PostGetAllEvent extends PostEvent {
  const PostGetAllEvent();

  @override
  List<Object> get props => [];
}
