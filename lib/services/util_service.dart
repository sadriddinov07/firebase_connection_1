import 'package:firebase_connection_1/blocs/post/post_bloc.dart';

sealed class Util {
  static bool validateRegistration(
      String username, String email, String password, String prePassword) {
    return username.isNotEmpty &&
        email.length >= 6 &&
        password.isNotEmpty &&
        password == prePassword;
  }

  static bool validateSingIn(String email, String password) {
    return email.length >= 6 && password.length >= 4;
  }

  static bool validatePost(PostCreateEvent event) =>
      event.title.length > 1 && event.content.length > 1;
}
