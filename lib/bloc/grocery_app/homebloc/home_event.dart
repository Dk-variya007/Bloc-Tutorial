import 'package:bloc_state_management/model/grocery_model.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  GroceryModel clickedItem;

  HomeProductWishlistButtonClickedEvent({required this.clickedItem});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  GroceryModel clickedItem;

  HomeProductCartButtonClickedEvent({required this.clickedItem});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {
}

class HomeCartButtonNavigateEvent extends HomeEvent {}
