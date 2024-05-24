import 'package:bloc_state_management/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_state_management/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_state_management/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Todo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            for (int i = 0; i < 10; i++) {
              context
                  .read<TodoBloc>()
                  .add(AddItem(todo: 'Text ' + i.toString()));
            }
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.list.isEmpty) {
              return const Center(
                child: Text("No todo found"),
              );
            } else {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.list[index].toString()),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(
                            DeleteItem(todo: state.list[index].toString()));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
