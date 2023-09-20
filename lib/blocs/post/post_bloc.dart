import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_connection_1/models/post_model.dart';
import 'package:firebase_connection_1/services/db_service.dart';
import 'package:firebase_connection_1/services/util_service.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostCreateEvent>(_postCreate);
    on<PostGetAllEvent>(_getAll);
    on<PostUpdateEvent>(_update);
    on<PostDeleteEvent>(_delete);
  }

  void _postCreate(PostCreateEvent event, Emitter emit) async {
    if (!Util.validatePost(event)) {
      emit(const PostFailure("Please check your email or password!"));
      return;
    }

    emit(PostLoading());

    await DBService.storePost(
      event.title,
      event.content,
      event.isPublic,
    );

    emit(PostCreateSuccess());
  }

  void _getAll(PostGetAllEvent event, Emitter emit) async {
    emit(PostLoading());

    final data = await DBService.readAllPost();

    if (data.isEmpty) {
      emit(const PostFailure("Empty datas!"));
      return;
    }

    emit(PostGetAll(data));
  }

  void _delete(PostDeleteEvent event, Emitter emit) async {
    emit(PostLoading());

    await DBService.delete(event.id);
    emit(PostDeleteSuccess());
  }

  void _update(PostUpdateEvent event, Emitter emit) async {
    emit(PostLoading());

    await DBService.update(
      event.id,
      event.title,
      event.content,
      event.isPublic,
    );

    emit(PostUpdateSuccess());
  }
}
