import 'package:bloc_state_management/model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final List<UserModel> userList;

  const UserState({this.userList = const []});

  UserState copyWith({List<UserModel>? userList}) {
    return UserState(userList: userList ?? this.userList);
  }

  @override
  List<Object?> get props => [userList];
}
