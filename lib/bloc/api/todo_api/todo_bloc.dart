import 'package:bloc_state_management/model/todo_model.dart';
import 'package:bloc_state_management/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoAPiBloc extends Bloc<TodoEvent, TodoState> {
  TodoAPiBloc() : super(TodoInitial()) {
    on<TodoInitialEvent>(todoInitialEvent);
  }

  Future<void> todoInitialEvent(
      TodoInitialEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    List<TodoModel> todo = await TodoRepository.fetchTodo();
    emit(TodoFetchState(todo: todo));
  }
}
