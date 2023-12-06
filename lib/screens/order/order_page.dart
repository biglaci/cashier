import 'package:flutter/material.dart';

import '../../utilities/po_lead.dart';
import '../../view_models/main_view_models.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends  State<OrderPage>    {
  //const OrderPage({super.key});


  final HomeViewModel homeViewModel = HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: listData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('Loading...'),
                );
              } else {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 4.0,
                  children: snapshot.data,
                );
              }
            }),
      ),
    );
  }
}
