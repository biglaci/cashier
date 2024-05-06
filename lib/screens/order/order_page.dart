import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/mlead.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends  State<OrderPage>  {


    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Json Parsing Demo'),
        ),
        body: ChangeNotifierProvider<mlead>(
          create: (context) => mlead(
              columns: ["IsActive","Name","PINCode","Email","Phone"],
              model: 'models/ad_user',
              orderBy : ["Name"],
            top:2,
            skip:10
          ),
          child: Consumer<mlead>(
            builder: (context, provider, child) {
              if (provider.data == null) {
                provider.getData();
                return Center(child: CircularProgressIndicator());
              }
              // when we have the json loaded... let's put the data into a data table widget
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: provider.columnList,
                    rows: provider.data!.records!
                        .map((data) =>
                    // we return a DataRow every time
                    DataRow(
                      // List<DataCell> cells is required in every row
                        cells: [
                          DataCell((data.isActive??true)
                              ? Icon(
                            Icons.verified_user,
                            color: Colors.green,
                          )
                              : Icon(Icons.cancel, color: Colors.red)),
                          // I want to display a green color icon when user is verified and red when unverified
                          DataCell(Text(data.name??'')),
                          DataCell(Text(data.value??'')),
                          DataCell(Text(data.eMail??'')),
                          DataCell(Text(data.phone??'')),
                        ]))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

  @override
  // TODO: implement restorationId
  String? get restorationId => throw UnimplementedError();


}




