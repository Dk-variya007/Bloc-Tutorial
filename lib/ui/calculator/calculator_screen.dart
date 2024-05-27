
import 'package:bloc_state_management/bloc/calculator_bloc/calculator_bloc.dart';
import 'package:bloc_state_management/bloc/calculator_bloc/calculator_event.dart';
import 'package:bloc_state_management/bloc/calculator_bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Center(
        child: SizedBox(
          width: width * 0.7,
          height: height * 0.5,
          child: Card(
            color: Colors.tealAccent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Enter number 1')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextField(
                      controller: _controller2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Enter number 2')),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(_controller1.text) ?? 0.0;
                          final num2 = double.tryParse(_controller2.text) ?? 0.0;
                          context.read<CalculatorBloc>().add(AddEvent(num1, num2));
                        },
                        child: const Text("Add")),
                    ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(_controller1.text) ?? 0.0;
                          final num2 = double.tryParse(_controller2.text) ?? 0.0;
                          context.read<CalculatorBloc>().add(SubtractEvent(num1, num2));
                        },
                        child: const Text("Sub")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(_controller1.text) ?? 0.0;
                          final num2 = double.tryParse(_controller2.text) ?? 0.0;
                          context.read<CalculatorBloc>().add(DivideEvent(num1, num2));
                        },
                        child: const Text("Div")),
                    ElevatedButton(
                        onPressed: () {
                          final num1 = double.tryParse(_controller1.text) ?? 0.0;
                          final num2 = double.tryParse(_controller2.text) ?? 0.0;
                          context.read<CalculatorBloc>().add(MultiplyEvent(num1, num2));
                        },
                        child: const Text("Mul")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    print("ans");
                    return Text("Ans: ${state.result}");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
