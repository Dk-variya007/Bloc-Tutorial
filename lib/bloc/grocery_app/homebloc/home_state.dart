part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActiveState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeActiveState {}

class HomeLoadedSuccessState extends HomeActiveState {
  final List<GroceryModel> product;

  HomeLoadedSuccessState({required this.product});
}

class HomeNavigateToWishlistPageActionState extends HomeActiveState {}

class HomeNavigationToCartPageActionState extends HomeActiveState {}

class HomeProductItemWishlistActionState extends HomeActiveState {}

class HomeProductItemCartActionState extends HomeActiveState {}
