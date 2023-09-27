import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plateron_app/features/food_item/presentation/providers/food_item_provider.dart';
import 'package:plateron_app/routes/app_routes.dart';

class PlaceOrderWidget extends HookConsumerWidget {
  const PlaceOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemListProvider = ref.watch(foodItemProvider);
    return foodItemListProvider.isEmpty
        ? const SizedBox()
        : SafeArea(
            bottom: true,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 14),
                  const SizedBox(width: 4),
                  Text('${foodItemListProvider.length} items'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.cartRoute),
                    child: Text(
                      'Place Order',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
