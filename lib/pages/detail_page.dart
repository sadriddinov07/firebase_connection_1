import 'package:firebase_connection_1/blocs/post/post_bloc.dart';
import 'package:firebase_connection_1/views/custom_text_field_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final titleController = TextEditingController();

  final contentController = TextEditingController();

  bool isPublic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DetailPage"),
      ),
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

          if (state is PostCreateSuccess && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Created")),
            );
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(controller: titleController, title: "Title"),
                  CustomTextField(
                      controller: contentController, title: "Content"),
                  Row(
                    children: [
                      Checkbox(
                        value: isPublic,
                        onChanged: (value) {
                          isPublic = value ?? isPublic;
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Do you want to make your post public?",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              ),
            ),
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(
                PostCreateEvent(
                  title: titleController.text.trim(),
                  content: contentController.text.trim(),
                  isPublic: isPublic,
                ),
              );
        },
        child: const Icon(Icons.cloud_upload_rounded),
      ),
    );
  }
}
