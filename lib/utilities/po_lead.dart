import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/po.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Po>> listData() async {
  Future<List<Po>> records = IdempiereClient().get<Po>(
      "/models/ad_user", (json) => Po(json),
      orderBy: [ 'Name'],
      select: ['Name', 'Value','EMail','Phone'],
      top: 10,
      skip: 2,
      showsql: true);
  List<Po> list = await records ;
  return list;
}
Future<List<Po>> fetchData() async {
  // geting response from API.
  Future<List<Po>> records = IdempiereClient().get<Po>(
      "/models/ad_user", (json) => Po(json),
      orderBy: [ 'Name'],
      select: ['Name', 'Value','EMail','Phone'],
      top: 10,
      skip: 2,
      showsql: true);

  List<Po> list = await records ;

  return  list; //list.map((e) => Lead.fromJson(e)).toList();

}
