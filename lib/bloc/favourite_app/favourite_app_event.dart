import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const SelectItem({required this.item});
}

class UnselectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const UnselectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvent {}
