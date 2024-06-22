import 'package:bloc_state_management/data/cart_list.dart';
import 'package:bloc_state_management/data/grocery_data.dart';
import 'package:bloc_state_management/data/wish_list.dart';
import 'package:bloc_state_management/model/grocery_model.dart';
import 'package:bloc_state_management/ui/grocery/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/bloc/grocery_app/homebloc/home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
  }

  void homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map((e) => GroceryModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  void homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
    wishListItem.add(event.clickedItem);
    print(wishListItem);
    emit(HomeProductItemWishlistActionState());
  }

  void homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product clicked');
    cartListItem.add(event.clickedItem);
    print(cartListItem);
    emit(HomeProductItemCartActionState());
  }

  void homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigationToCartPageActionState());
  }

  void homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }
}
