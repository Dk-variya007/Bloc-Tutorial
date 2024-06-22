import 'package:bloc_state_management/data/wish_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/model/grocery_model.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishInitialEvent>(wishInitialEvent);
    on<WishListRemoveEvent>(wishListRemoveEvent);
  }

  void wishInitialEvent(WishInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishSuccessState(wishItems: wishListItem));
  }

  void wishListRemoveEvent(
      WishListRemoveEvent event, Emitter<WishlistState> emit) {
    wishListItem.remove(event.clickedItem);
    emit(WishSuccessState(wishItems: wishListItem));
  }
}
