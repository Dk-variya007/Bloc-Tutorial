import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:bloc_state_management/repository/favourite_repository.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> temFavouriteList = [];

  FavouriteAppBloc() : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavourite);
    on<SelectItem>(_selectItem);
    on<UnselectItem>(_unselectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await FavouriteRepository.fetchItem();
    emit(state.copyWith(
        listStatus: ListStatus.success,
        favouriteItemList: List.from(favouriteList)));
  }

  void _addFavourite(FavouriteItem event, Emitter<FavouriteItemStates> emit) {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    if (event.item.isFavourite) {
      if (temFavouriteList.contains(favouriteList[index])) {
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    } else {
      if (temFavouriteList.contains(favouriteList[index])) {
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteItemStates> emit) {
    temFavouriteList.add(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavouriteList)));
  }

  void _unselectItem(UnselectItem event, Emitter<FavouriteItemStates> emit) {
    temFavouriteList.remove(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit) {
    for (int i = 0; i < temFavouriteList.length; i++) {
      favouriteList.remove(temFavouriteList[i]);
    }
    temFavouriteList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList)));
  }
}
