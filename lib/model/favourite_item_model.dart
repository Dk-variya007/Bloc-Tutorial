import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel(
      {required this.value,
      required this.id,
      this.isDeleting = false,
      this.isFavourite = false});

  final String id;
  final String value;
  final bool isFavourite;
  final bool isDeleting;

  FavouriteItemModel copyWith(
      {String? id, String? value, bool? isFavourite, bool? isDeleting}) {
    return FavouriteItemModel(
        value: value ?? this.value,
        id: id ?? this.id,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
