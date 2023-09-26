import 'package:flutter/material.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/item_price_section.dart';
import 'package:plateron_app/models/food_item.dart';

class ItemDetailWidget extends StatelessWidget {
  const ItemDetailWidget({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(foodItem.name),
            const SizedBox(height: 4),
            Text(
              foodItem.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            ItemPriceSection(foodItem: foodItem),
          ],
        ),
      ),
    );
  }
}
