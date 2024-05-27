import 'package:bloc_state_management/bloc/calculator_bloc/calculator_bloc.dart';
import 'package:bloc_state_management/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_state_management/bloc/image_bloc/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc/login/login_bloc.dart';
import 'package:bloc_state_management/bloc/post_bloc/post_bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_state_management/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_state_management/bloc/user_api_bloc/user_api_bloc.dart';
import 'package:bloc_state_management/ui/calculator/calculator_screen.dart';
import 'package:bloc_state_management/ui/counter/counter_screen.dart';
import 'package:bloc_state_management/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_state_management/ui/image_picker/image_picker.dart';
import 'package:bloc_state_management/ui/login/login_screen.dart';
import 'package:bloc_state_management/ui/post/post_screen.dart';
import 'package:bloc_state_management/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_state_management/ui/todo/todo.dart';
import 'package:bloc_state_management/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => CalculatorBloc()),
        BlocProvider(create: (_) => ImagePickerBloc()),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteAppBloc()),
        BlocProvider(create: (_) => PostBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
