import 'package:bloc_state_management/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                  visible: state.temFavouriteItemList.isNotEmpty ? true : false,
                  child: IconButton(
                      onPressed: () {
                        context.read<FavouriteAppBloc>().add(DeleteItem());
                      }, icon: const Icon(Icons.delete)));
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<FavouriteAppBloc, FavouriteItemStates>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(
                child: Text("Something went wrong"),
              );
            case ListStatus.success:
              return Container(
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Card(
                        color: Colors.tealAccent,
                        child: ListTile(
                          leading: Checkbox(
                            value: state.temFavouriteItemList.contains(item),
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(SelectItem(item: item));
                              } else {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(UnselectItem(item: item));
                              }
                            },
                          ),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel favouriteItemModel =
                                  FavouriteItemModel(
                                      value: item.value,
                                      id: item.id,
                                      isFavourite:
                                          item.isFavourite ? false : true);
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(FavouriteItem(item: favouriteItemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
