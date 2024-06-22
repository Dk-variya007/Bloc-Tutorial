import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/internet/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetOffEvent>((event, emit) => emit(InternetOffState()));
    on<InternetOnEvent>((event, emit) => emit(InternetOnState()));

    streamSubscription = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        print("Connectivity Result: Connected"); // Debug print
        add(InternetOnEvent());
      } else {
        print("Connectivity Result: Not Connected"); // Debug print
        add(InternetOffEvent());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
