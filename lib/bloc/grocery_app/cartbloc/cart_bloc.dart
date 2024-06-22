import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/data/cart_list.dart';
import 'package:bloc_state_management/model/grocery_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  void cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartListItem));
  }

  void cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartListItem.remove(event.removeItem);
    emit(CartSuccessState(cartItems: cartListItem));
  }
}
