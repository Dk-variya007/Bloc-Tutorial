part of 'signin_bloc.dart';

abstract class SignInEvent {}

class SignInWithTextEvent extends SignInEvent {
  final String email;
  final String pass;

  SignInWithTextEvent(this.email, this.pass);
}

class SingInButtonEvent extends SignInEvent {
  final String email;
  final String pass;

  SingInButtonEvent(this.pass, this.email);
}
