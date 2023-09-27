import 'package:flutter/material.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/item_add_section.dart';
import 'package:plateron_app/models/food_item.dart';
import 'package:plateron_app/shared/theme/style_manager.dart';

class ItemPriceSection extends StatelessWidget {
  const ItemPriceSection({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ ${foodItem.price}',
          style: getH1Medium(),
        ),
        const Spacer(),
        ItemAddSection(foodItem: foodItem)
      ],
    );
  }
}
