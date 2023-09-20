import 'dart:convert';
import 'package:firebase_connection_1/models/post_model.dart';
import 'package:firebase_connection_1/services/auth_service.dart';
import 'package:firebase_database/firebase_database.dart';

sealed class DBService {
  static final db = FirebaseDatabase.instance;

  static Future<void> storePost(
      String title, String content, bool isPublic) async {
    final folder = db.ref(Folder.post);
    final child = folder.push();
    final id = child.key!;
    final userId = AuthService.user.uid;

    final post = Post(
      id: id,
      title: title,
      content: content,
      userId: userId,
      isPublic: isPublic,
    );
    await child.set(post.toJson());
  }

  static Future<List<Post>> readAllPost() async {
    final folder = db.ref(Folder.post);
    List<Post> posts = [];

    final data = await folder.get();

    jsonDecode(jsonEncode(data.value)).forEach((key, value) {
      final post = Post.fromJson(value as Map<String, Object?>);
      posts.add(post);
    });
    return posts;
  }

  static Future<void> delete(String id) async {
    final folder = db.ref("${Folder.post}/$id");

    await folder.remove();
  }

  static Future<void> update(
    String id,
    String? title,
    String? content,
    bool? isPublic,
  ) async {
    final folder = db.ref("${Folder.post}/$id");
    List<Post> posts = await readAllPost();
    Post data = posts.firstWhere((element) => element.id == id);
    final post = Post(
      id: data.id,
      title: title!.isEmpty ? data.title : title,
      content: content!.isEmpty ? data.content : content,
      userId: data.userId,
      isPublic: isPublic ?? data.isPublic,
    );

    await folder.update(post.toJson());
  }
}

sealed class Folder {
  static const post = "Post";
}
