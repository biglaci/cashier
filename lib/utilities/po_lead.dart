import '../../models/product_type.dart';
import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/po.dart';

Future<List<Po>> listData() async {
  Future<List<Po>> records = IdempiereClient().get<Po>(
      "/models/ad_user", (json) => Po(json),
      orderBy: [ 'Name'],
      select: ['Name', 'Value'],
      top: 10,
      skip: 2,
      showsql: true);
  List<Po> list = await records ;
  return list;
}
