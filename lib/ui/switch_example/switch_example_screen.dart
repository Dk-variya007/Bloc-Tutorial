import 'package:bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_event.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notification"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  print("noti");
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(EnableOrDisableNotification());
                    },
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: 300,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(height: 10),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              print("slider");
              return Slider(
                value: state.slider, // Use the slider value from state
                onChanged: (value) {
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                },
              );
            },
          )
        ],
      ),
    );
  }
}
