import 'package:flutter/material.dart';
import '../../models/mactivities.dart';
import '../idempiere_rest/idempiere_client.dart';

class activities   {
  activities({
    required this.columns,
    required this.model,
    required this.orderBy,
    required this.top,
    required this.skip
  }) {
    _addColumns();
  }

  final List<String> columns;
  final String model;
  final List<String> orderBy;
  final int top;
  final int skip;
  mactivities? data;
  List<Records> _leadlist = [];
  List<DataColumn> _columnList = [];
  List<DataColumn> get columnList => _columnList;


  Future getData() async {
    var mJson = await IdempiereClient().getJson(
        model,
        orderBy: orderBy,
        select: columns,
        top: top,
        skip: skip,
        showsql: true);
    // now we have a json...
    this.data = mactivities.fromJson(mJson);
  }

  Future<List<Records>>  getRecords() async {
    var mJson = await IdempiereClient().getJson(
        model,
        orderBy: orderBy,
        select: columns,
        top: top,
        skip: skip,
        showsql: true);
    // now we have a json...
    this.data = mactivities.fromJson(mJson);
    _leadlist = this.data!.records!;
    return _leadlist;
  }

  void _addColumns() {
    for (var i = 0; i < columns.length; i++) {
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    };
  }

}