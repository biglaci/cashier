import 'package:data_table_2/data_table_2.dart';
import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/po.dart';
import 'package:flutter/material.dart';

class POList {
  POList({
    required this.columns,
    required this.model,
    required this.orderBy,
    required this.top,
    required this.skip
  }) {
    _addColumns();
   // _addRows();
  }

  final List<String> columns;
  final String model;
  final List<String> orderBy;
  final int top;
  final int skip;

  List<DataColumn> _columnList = [];
  List<DataRow2> _rowList = [];
  List<Po> _polist = [];

  List<DataColumn> get columnList => _columnList;
  List<DataRow2> get rowList => _rowList;
  List<Po> get polist => _polist;

  void _addColumns() {
    for(var i=0;i<columns.length;i++){
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    } ;
  }

 Future<List<DataRow2>> getRows() async {
      Future<List<Po>> records = IdempiereClient().get<Po>(
          model, (json) => Po(json),
         orderBy: orderBy,
         select: columns,
         top: top,
         skip: skip,
         showsql: true);
      _polist = await records ;
     for(var i=0;i<_polist.length;i++){

       for (var i = 0; i < _polist.length; i++) {
         _rowList.add(DataRow2(cells:getCells(_polist[i] )));
       }
     }
     return _rowList;
  }

  getCells(Po po) {
    List<DataCell> datacells=[];
    for(var i=0;i<columns.length;i++){
      datacells.add( DataCell(Text(po.json_po[columns[i]]), ));
    }
    return datacells;
  }
}


