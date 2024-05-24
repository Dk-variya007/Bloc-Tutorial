import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddItem extends TodoEvent {
  final String todo;

  const AddItem({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteItem extends TodoEvent {
  final String todo;

  const DeleteItem({required this.todo});

  @override
  List<Object> get props => [todo];
}
