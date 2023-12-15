import 'dart:io';

import 'package:flutter/material.dart';

import '../../idempiere_rest/po.dart';
import '../../utilities/po_list.dart';
import '../../view_models/main_view_models.dart';
import '../../utilities/lw_lead.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends  State<OrderPage>  with RestorationMixin {
  final HomeViewModel homeViewModel = HomeViewModel();
  DessertDataSource? _dessertsDataSource;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {

    // Initialize _dessertsDataSource if it is null
    _dessertsDataSource ??= DessertDataSource(context);

    // Sort the data source according to the sort column index

  }
    @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  ListView(
        restorationId: 'lead_table_list_view',
          children: [
            PaginatedDataTable(
              header: Text('Nutrition'), // Set the header text of the data table
              rowsPerPage: 10,
              initialFirstRowIndex: 1,
              sortColumnIndex: 1,
              sortAscending: false,
              columns: [
                DataColumn(
                  label: Text('Dessert 1 Serving'), // Set the label of the first column
                ),
                DataColumn(
                  label: Text('Calories'), // Set the label of the second column
                  numeric: true,
                ),
                DataColumn(
                  label: Text('Fat (g)'), // Set the label of the third column
                  numeric: true,
                ),
              ],
              source: _dessertsDataSource!,
            ),
          ],
      )
    );
  }


  @override
  // TODO: implement restorationId
  String get restorationId => 'lead_table_demo';


}



