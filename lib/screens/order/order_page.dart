import 'package:flutter/material.dart';

import '../../idempiere_rest/po.dart';
import '../../utilities/po_lead.dart';
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
  //const OrderPage({super.key});


  final HomeViewModel homeViewModel = HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: listData() ,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('Loading...'),
                );
              } else {
                return
                  SingleChildScrollView(
                    // Using scrollView for scrolling and formating
                      scrollDirection: Axis.vertical,
                      // using FittedBox for fitting complte table in screen horizontally.
                      child: FittedBox(
                          child: DataTable(
                            sortColumnIndex: 1,
                            showCheckboxColumn: false,
                            border: TableBorder.all(width: 1.0),
                            // Data columns as required by APIs data.
                            columns: const [
                              DataColumn(
                                  label: Text(
                                    "id",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    "name ",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    "value",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  )),
                            ],
                            // Main logic and code for geting data and shoing it in table rows.
                            rows: snapshot.data
                                .map(
                              //maping each rows with datalist data
                                    (data) => DataRow(cells: [
                                  DataCell(
                                    Text(data.id.toString(),
                                        style: const TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.w500)),
                                  ),
                                  DataCell(Text(data.json_po['Name'].toString(),
                                      style: const TextStyle(
                                          fontSize: 26, fontWeight: FontWeight.w500))),
                                  DataCell(
                                    Text(data.json_po['Value'].toString(),
                                        style: const TextStyle(
                                            fontSize: 26, fontWeight: FontWeight.w500)),
                                  ),
                                ]))
                                .toList(), // converting at last into list.
                          )));
              }
            }),
      ),
    );
  }
}

