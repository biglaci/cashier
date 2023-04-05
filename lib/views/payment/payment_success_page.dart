import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/main_page.dart';
import '../../utilities/color_custom.dart';

class PaymentSuccessPage extends StatelessWidget {
  final int totalItem;
  final double totalPaid;
  final double change;

  PaymentSuccessPage({
    Key? key,
    required this.totalItem,
    required this.totalPaid,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF2DDD98),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Success',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Items: $totalItem',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Total Paid: \$${totalPaid.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Change: \$${change.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Send Email'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(
                    () => const MainPage(),
                    transition:
                        Transition.topLevel, // Pilih transisi yang diinginkan
                  );
                },
                child: Text('Place New Order'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
