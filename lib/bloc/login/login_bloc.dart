import 'package:bloc_state_management/bloc/login/login_event.dart';
import 'package:bloc_state_management/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChange>(_emailChange);
    on<PasswordChange>(_passwordChange);
    on<LoginApi>(_loginapi);
  }

  void _emailChange(EmailChange event, Emitter<LoginState> emit) {
    emit(state.copyWith());
  }

  void _passwordChange(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith());
  }

  void _loginapi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map data = {"email": state.email, "password": state.password};
    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"));
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: "Login Successful"));
      } else {
        emit(state.copyWith(message: "error Occured", loginStatus: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}

