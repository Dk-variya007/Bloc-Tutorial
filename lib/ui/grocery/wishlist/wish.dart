import 'package:bloc_state_management/bloc/grocery_app/wishlist/wishlist_bloc.dart';
import 'package:bloc_state_management/ui/grocery/wishlist/wish_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wish extends StatefulWidget {
  const Wish({super.key});

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish> {
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    wishlistBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listener: (context, state) {},
      listenWhen: (current, previous) => current is WishlistActiveState,
      buildWhen: (current, previous) => current is! WishlistActiveState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishSuccessState :
            final successState = state as WishSuccessState;
            return Scaffold(
              body: ListView.builder(
                  itemCount: successState.wishItems.length,
                  itemBuilder: (context, index) {
                    return WishTileWidget(
                        wishBloc: wishlistBloc,
                        productDataModel: successState.wishItems[index]);
                  }),
            );

          default:
        }
        return Container();
      },
    );
  }
}
