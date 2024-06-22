part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class WishInitialEvent extends WishlistEvent {}
class WishListRemoveEvent extends WishlistEvent{
  GroceryModel clickedItem;
  WishListRemoveEvent({required this.clickedItem});
}
