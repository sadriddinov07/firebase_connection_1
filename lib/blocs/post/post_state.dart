part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostFailure extends PostState {
  final String message;

  const PostFailure(this.message);

  @override
  List<Object> get props => [];
}

class PostCreateSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostUpdateSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostDeleteSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostGetAll extends PostState {
  final List<Post> posts;

  const PostGetAll(this.posts);

  @override
  List<Object> get props => [posts];
}
