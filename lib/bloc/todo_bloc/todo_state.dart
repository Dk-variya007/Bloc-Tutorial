import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> list;

  const  TodoState({this.list = const []});

  @override
  List<Object?> get props {
    return [list];
  }
}
