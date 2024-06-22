import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/api/todo_api/todo_bloc.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  TodoAPiBloc todoBloc = TodoAPiBloc();

  @override
  void initState() {
    // TODO: implement initState
    todoBloc.add(TodoInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAPiBloc, TodoState>(
      bloc: todoBloc,
      listener: (context, state) {},
      listenWhen: (current, previous) => current is TodoActionState,
      buildWhen: (current, previous) => current is! TodoActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case TodoLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case TodoFetchState:
            final successState = state as TodoFetchState;
            return Scaffold(
              body: ListView.builder(
                itemCount: successState.todo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(successState.todo[index].completed.toString()),
                    subtitle: Text(successState.todo[index].id.toString()),
                  );
                },
              ),
            );
          case TodoErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
        }
        return Container();
      },
    );
  }
}
