import 'package:bloc_state_management/bloc/api/post_bloc/post_bloc.dart';
import 'package:bloc_state_management/bloc/api/post_bloc/post_event.dart';
import 'package:bloc_state_management/bloc/api/post_bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState(); // Ensure to call super.initState()
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case PostStatus.failure:
              return const Center(
                child: Text("Failed to fetch data"),
              );

            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.postList[index].name.toString()),
                  );
                },
              );
          }
          return Container(); // Add a fallback return statement
        },
      ),
    );
  }
}
