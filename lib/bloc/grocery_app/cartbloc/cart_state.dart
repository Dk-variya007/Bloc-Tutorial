part of 'cart_bloc.dart';

abstract class CartState {}

abstract class CartActionState {}

class CartInitial extends CartState {}

class CartInitialState extends CartState {}

class CartSuccessState extends CartState {
  final List<GroceryModel> cartItems;

  CartSuccessState({required this.cartItems});
}
