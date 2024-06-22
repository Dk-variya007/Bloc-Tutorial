import 'dart:developer';

import 'package:bloc_state_management/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_state_management/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            buildWhen: (previous, current) => current.counter != previous.counter,
            bloc: counterBloc,
            builder: (context, state) {
              log("Builder called");
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 60),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    //context.read<CounterBloc>().add(IncrementCounter());
                    counterBloc.add(IncrementCounter());
                  },
                  child: const Text("Increment")),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                  //  context.read<CounterBloc>().add(DecrementCounter());
                    counterBloc.add(DecrementCounter());
                  },
                  child: const Text("Decrement")),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(ResetCounter());
              },
              child: const Text("Reset")), // Add this button
        ],
      ),
    );
  }
}
