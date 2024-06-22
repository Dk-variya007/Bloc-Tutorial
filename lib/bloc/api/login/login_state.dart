import 'package:equatable/equatable.dart';

enum LoginStatus { initial, success, loading, error }

class LoginState extends Equatable {
  final String message;
  final String email;
  final String password;
  final LoginStatus loginStatus;

  const LoginState(
      {this.loginStatus = LoginStatus.initial,
      this.message = '',
      this.email = '',
      this.password = ''});

  LoginState copyWith(
      {String? message,
      String? email,
      String? password,
      LoginStatus? loginStatus}) {
    return LoginState(
        email: email ?? this.email,
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [email, message, password, loginStatus];
}
