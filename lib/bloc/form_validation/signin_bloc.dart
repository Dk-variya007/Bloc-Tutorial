import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInWithTextEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("Please Enter Valid Email"));
      } else if (event.pass.length <= 7) {
        emit(SignInErrorState("length must be above 7"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SingInButtonEvent>((event, emit) {
      emit(SingInLoadingState());
    });
  }
}
