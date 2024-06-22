import 'package:bloc_state_management/bloc/internet/internet_bloc.dart';
import 'package:bloc_state_management/bloc/internet/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({super.key});

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetInitialState) {
            return const Text("Loading");
          } else if (state is InternetOnState) {
            return const Text("Connected");
          } else if (state is InternetOffState) {
            return const Text("Not Connected..");
          } else {
            return const Text("Unknown State");
          }
        },
      )),
    );
  }
}
