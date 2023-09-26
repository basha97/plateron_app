import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    required String description,
    required String imageUrl,
  }) = _FoodItem;
}
