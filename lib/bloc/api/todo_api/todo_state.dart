part of 'todo_bloc.dart';

abstract class TodoState {}

abstract class TodoActionState extends TodoState {}

class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoErrorState extends TodoState {}

class TodoFetchState extends TodoState {
  final List<TodoModel> todo;
  TodoFetchState({required this.todo});
}
