import 'package:flutter/material.dart';

import '../../idempiere_rest/po.dart';
import '../../utilities/po_list.dart';
import '../../view_models/main_view_models.dart';
import 'package:data_table_2/data_table_2.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends  State<OrderPage>    {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  ListView(
          children: [
            _createDataTable()
          ],
      )
    );
  }
}

DataTable _createDataTable() {
  var datalist=  POList(columns:  ['Name','Value','Phone'],
        model:'/models/ad_user',orderBy: ['Name'],skip: 2,top: 10);
  return DataTable(columns: datalist.columnList, rows: datalist.rowList);
}

