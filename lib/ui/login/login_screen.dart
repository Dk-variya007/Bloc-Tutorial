import 'package:bloc_state_management/bloc/login/login_bloc.dart';
import 'package:bloc_state_management/bloc/login/login_event.dart';
import 'package:bloc_state_management/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final _email = FocusNode();
  final _password = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (current, previous) => current.email != previous.email,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: _email,
                    decoration: const InputDecoration(labelText: "Email"),
                    onFieldSubmitted: (value) {},
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChange(email: value));
                    },
                  ),
                );
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.password != previous.password,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: _password,
                    decoration: const InputDecoration(labelText: "Password"),
                    onFieldSubmitted: (value) {},
                    onChanged: (value) {
                      context
                          .read<LoginBloc>()
                          .add(PasswordChange(password: value));
                    },
                  ),
                );
              },
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message.toString())));
                }
                if (state.loginStatus == LoginStatus.loading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Submitting")));
                }
                if (state.loginStatus == LoginStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Successful")));
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApi());
                      },
                      child: const Text("Login"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
