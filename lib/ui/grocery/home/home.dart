import 'package:bloc_state_management/bloc/grocery_app/homebloc/home_bloc.dart';
import 'package:bloc_state_management/bloc/grocery_app/homebloc/home_event.dart';
import 'package:bloc_state_management/ui/grocery/cart/cart.dart';
import 'package:bloc_state_management/ui/grocery/home/product_tile_widget.dart';
import 'package:bloc_state_management/ui/grocery/wishlist/wish.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (current, previous) => current is HomeActiveState,
      buildWhen: (current, previous) => current is! HomeActiveState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Wish()));
        } else if (state is HomeNavigationToCartPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeProductItemWishlistActionState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item WishListed")));
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item Carted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Grocery App"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.shopping_bag_outlined))
                  ],
                ),
                body: ListView.builder(
                  itemCount: successState.product.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.product[index],
                      homeBloc: homeBloc,
                    );
                  },
                ));
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text("Error")));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
