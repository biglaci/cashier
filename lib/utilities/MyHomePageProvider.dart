import 'dart:convert';
import '../../view_models/mlead.dart';

import 'package:flutter/widgets.dart';

import '../idempiere_rest/idempiere_client.dart';

class MyHomePageProvider extends ChangeNotifier {
   mlead? data;

  Future getData(context) async {

    var mJson = await IdempiereClient().getJson(
        'models/ad_user',
        orderBy: ['Name'],
        select: [],
        top: 10,
        skip: 0,
        showsql: true);
    // now we have a json...
    this.data = mlead.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }
}