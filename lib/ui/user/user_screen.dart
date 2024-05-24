import 'package:bloc_state_management/bloc/user_api_bloc/user_api_bloc.dart';
import 'package:bloc_state_management/bloc/user_api_bloc/user_api_event.dart';
import 'package:bloc_state_management/bloc/user_api_bloc/user_api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.userList.length,
          itemBuilder: (context, index) {
            final item = state.userList[index];
            return ListTile(
              title: Text(item.name.toString()),
            );
          },
        );
      },
    ));
  }
}
