import 'package:flutter/material.dart';

class PlaceOrderWidget extends StatelessWidget {
  const PlaceOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Text('2 items'),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Place Order',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
