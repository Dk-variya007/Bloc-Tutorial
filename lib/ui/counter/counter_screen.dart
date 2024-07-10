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
  late CounterBloc counterBloc;

  @override
  void initState() {
    super.initState();
    counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Example"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                final action = state.counter > 0 ? 'incremented' : 'decremented';
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Counter $action to ${state.counter}')),
                );
              },
              child: BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (previous, current) => current.counter != previous.counter,
                builder: (context, state) {
                  log("Builder called");
                  return Text(
                    state.counter.toString(),
                    style: const TextStyle(fontSize: 60),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(IncrementCounter());
                  },
                  child: const Text("Increment"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(DecrementCounter());
                  },
                  child: const Text("Decrement"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterBloc.add(ResetCounter());
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
