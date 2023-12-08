import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/po.dart';
import 'dart:convert';

Future<List<Lead>> listData() async {
  Future<List<Po>> records = IdempiereClient().get<Po>(
      "/models/ad_user", (json) => Po(json),
      orderBy: [ 'Name'],
      select: ['Name', 'Value'],
      top: 10,
      skip: 2,
      showsql: true);
  List<Po> list = await records ;

  //var result = jsonDecode(list[0].json_po);
  //List jsonResponse = list["Records"] as List;


  List<Lead> leads= [];
  for (int i = 0; i < list.length; i++) {
    leads.add(Lead(id:i, name:"aaa", value:"ff",email:"sss@sss.sk"));
  }
  return leads;
}


// Modal class for the data we are getting from the API
class Lead {
  Lead({
    required this.id,
    required this.name,
    required this.value,
    this.email=""
  });

  final int id;
  final String name;
  final String value;
  final String email;

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["ID"],
    name: json["Name"],
    value: json["Value"],
    email: json["EMail"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Name": name,
    "Value": value,
    "Email": email,
  };
}