import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(const TodoState(list: [])) {
    on<AddItem>(_addItem);
    on<DeleteItem>(_deleteItem);
  }

  void _addItem(AddItem event, Emitter<TodoState> emit) {
    todoList.add(event.todo);
    emit(TodoState(list: List.from(todoList)));
  }

  void _deleteItem(DeleteItem event, Emitter<TodoState> emit) {
    todoList.remove(event.todo);
    emit(TodoState(list: List.from(todoList)));
  }
}
