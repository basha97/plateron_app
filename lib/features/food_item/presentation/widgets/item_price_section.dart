import 'package:flutter/material.dart';
import 'package:plateron_app/models/food_item.dart';

class ItemPriceSection extends StatelessWidget {
  const ItemPriceSection({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('\$ ${foodItem.price}'),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: foodItem.quantity != null
              ? Row(
                  children: [
                    GestureDetector(
                        child: Icon(
                      Icons.add,
                      size: 14,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('1'),
                    ),
                    GestureDetector(
                        child: Icon(
                      Icons.remove,
                      size: 14,
                    )),
                  ],
                )
              : GestureDetector(
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
        ),
      ],
    );
  }
}
