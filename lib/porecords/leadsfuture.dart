import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/mlead.dart';

import 'package:flutter/widgets.dart';

import '../idempiere_rest/idempiere_client.dart';

class leadsfuture   {
  leadsfuture({
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

  mlead? data;
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
    this.data = mlead.fromJson(mJson);
  }

  Future<List<Records>>  getLeads() async {
    var mJson = await IdempiereClient().getJson(
        model,
        orderBy: orderBy,
        select: columns,
        top: top,
        skip: skip,
        showsql: true);
    // now we have a json...
    this.data = mlead.fromJson(mJson);
    _leadlist = this.data!.records!;
    return _leadlist;
  }

  void _addColumns() {
    for (var i = 0; i < columns.length; i++) {
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    };
  }

}