import 'package:flutter_test/flutter_test.dart';
import 'package:plateron_app/features/food_item/presentation/widgets/item_add_section.dart';
import 'package:plateron_app/models/food_item.dart';

void main() {
  test('findItemInList', () {
    List<FoodItem> addedItems = [
      FoodItem(
          id: '1',
          name: 'Item 1',
          price: 10.0,
          quantity: 1,
          description: '',
          imageUrl: ''),
      FoodItem(
          id: '2',
          name: 'Item 2',
          price: 20.0,
          quantity: 1,
          description: '',
          imageUrl: ''),
    ];

    FoodItem currentItem = FoodItem(
        id: '1',
        name: 'Item 1',
        price: 10.0,
        quantity: 1,
        description: '',
        imageUrl: '');
    expect(findItemInList(addedItems, currentItem), currentItem);

    FoodItem notInList = FoodItem(
        id: '3',
        name: 'Item 3',
        price: 30.0,
        quantity: 1,
        description: '',
        imageUrl: '');
    expect(findItemInList(addedItems, notInList), notInList);
  });

  test('calculateTotalAmount', () {
    List<FoodItem> addedItems = [
      FoodItem(
          id: '1',
          name: 'Item 1',
          price: 10.0,
          quantity: 2,
          description: '',
          imageUrl: ''),
      FoodItem(
          id: '2',
          name: 'Item 2',
          price: 20.0,
          quantity: 1,
          description: '',
          imageUrl: ''),
    ];

    String totalAmount = calculateTotalAmount(addedItems);
    expect(totalAmount, '40.00');
  });
}

String calculateTotalAmount(List<FoodItem> items) {
  double totalAmount = 0.0;
  for (var item in items) {
    totalAmount += item.price * (item.quantity ?? 1);
  }
  return totalAmount.toStringAsFixed(2);
}