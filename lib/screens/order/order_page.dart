import 'package:flutter/material.dart';

import '../../idempiere_rest/po.dart';
import '../../utilities/po_lead.dart';
import '../../view_models/main_view_models.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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

class UserDataTableSource extends DataTableSource {
  UserDataTableSource({
    required List<Po> userData,
  })  : _userData = userData,
        assert(userData != null);

  final List<Po> _userData;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _userData.length) {
      return null;
    }
    final _user = _userData[index];

    return DataRow.byIndex(
      index: index, // DON'T MISS THIS
      cells: <DataCell>[
        DataCell(Text('${_user.json_po['Name']}')),
        DataCell(Text('${_user.json_po['Value']}')),
        DataCell(Text('${_user.json_po['EMail']}')),
        DataCell(Text('${_user.json_po['Phone']}')),
        DataCell(Text('${_user.json_po['Created']}')),
        DataCell(Text('${_user.json_po['IsVendorLead']}')),
        DataCell(Text('${_user.json_po['IsSalesLead']}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _userData.length;

  @override
  int get selectedRowCount => 0;

}
