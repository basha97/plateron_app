import 'package:flutter/material.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/item_detail.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/item_image.dart';
import 'package:plateron_app/models/food_item.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemImageWidget(url: foodItem.imageUrl),
          const SizedBox(width: 8),
          ItemDetailWidget(foodItem: foodItem),
        ],
      ),
    );
  }
}
