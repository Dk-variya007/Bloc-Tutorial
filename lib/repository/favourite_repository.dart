import 'package:bloc_state_management/model/favourite_item_model.dart';

class FavouriteRepository {
  static Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generatedList(10));
  }

  static List<FavouriteItemModel> _generatedList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(value: 'Item ${index}', id: index.toString()));
  }
}
