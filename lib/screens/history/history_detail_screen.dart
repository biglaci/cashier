import 'package:flutter/material.dart';

import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}

class HistoryDetails extends StatelessWidget {
  final int orderNumber;
  final String date;
  final double transactionTotal;
  final List<Item> items;

  HistoryDetails({
    required this.orderNumber,
    required this.date,
    required this.transactionTotal,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: AppBar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          Texts.titleHistoryDetail(),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //MARK: Body
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('#$orderNumber',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(date, style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('Transaction Total: \$$transactionTotal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Items:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index].name}'),
                    subtitle: Text('\$${items[index].price}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // kirim ke email
              },
              child: Text('Send to Email'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // refund
              },
              child: Text('Refund'),
            ),
          ],
        ),
      ),
    );
  }
}
