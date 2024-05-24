import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temFavouriteItemList;

  const FavouriteItemStates({
    this.listStatus = ListStatus.loading,
    this.favouriteItemList = const [],
    this.temFavouriteItemList = const [],
  });

  FavouriteItemStates copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    List<FavouriteItemModel>? temFavouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temFavouriteItemList: temFavouriteItemList ?? this.temFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props =>
      [favouriteItemList, listStatus, temFavouriteItemList];
}
