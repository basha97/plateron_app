import 'package:flutter/material.dart';
import 'package:plateron_app/constants/dummy_food_items.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/food_item.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/place_order.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salad & Soups'),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: ListView.separated(
          itemBuilder: (_, index) =>
              FoodItemWidget(foodItem: dummyFoodItems[index]),
          separatorBuilder: (_, index) => const Divider(),
          itemCount: dummyFoodItems.length,
        ),
      ),
      bottomNavigationBar: const PlaceOrderWidget(),
      extendBody: true,
    );
  }
}
