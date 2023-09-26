import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

class ItemImageWidget extends StatelessWidget {
  const ItemImageWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        height: 100,
        width: 120,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

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
