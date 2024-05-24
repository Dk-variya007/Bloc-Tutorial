import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/user_api_bloc/user_api_event.dart';
import 'package:bloc_state_management/bloc/user_api_bloc/user_api_state.dart';
import 'package:bloc_state_management/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UserEvent>(fetchUser);
  }

  void fetchUser(UserEvent event, Emitter<UserState> emit) async {
    await UserRepository.getData().then((value) {
      emit(state.copyWith(userList: value));
    });
  }
}
