part of 'wishlist_bloc.dart';

abstract class WishlistState {}

abstract class WishlistActiveState {}

class WishlistInitial extends WishlistState {}

class WishSuccessState extends WishlistState {
  final List<GroceryModel> wishItems;

  WishSuccessState({required this.wishItems});
}
