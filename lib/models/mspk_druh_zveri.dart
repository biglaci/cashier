import 'dart:convert';
import 'package:flutter/material.dart';

import 'spk_druh_zveri.dart';

import 'package:flutter/widgets.dart';

import '../idempiere_rest/idempiere_client.dart';

class MspkDruhZveri extends ChangeNotifier {
  MspkDruhZveri({
    required this.columns,
    required this.model,
    required this.orderBy,
    required this.top,
    required this.skip
  }) {
    _addColumns();
    //  _addRows();
  }

  final List<String> columns;
  final String model;
  final List<String> orderBy;
  final int top;
  final int skip;
  SpkDruhZveri? data;

  List<DataColumn> _columnList = [];
  List<DataColumn> get columnList => _columnList;
  Future getData() async {

    var mJson = await IdempiereClient().getJson(
        'models/spk_druh_zveri',
        orderBy: ['spk_druh_zveri_id'],
        select: ['Name'],
        top: 20,
        skip: 0,
        showsql: true);
    // now we have a json...
    this.data = SpkDruhZveri.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }

  void _addColumns() {
    for (var i = 0; i < columns.length; i++) {
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    };
  }

}