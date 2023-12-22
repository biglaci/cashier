
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../porecords/activities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // HomePageState({super.key});

  final activities _activities=activities(columns: [""],
      model: 'models/flv_activity',
      orderBy : ["startdate"],
      top:10,
      skip:0);

  String selectedCountry = "AF";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        Expanded(
          child: FutureBuilder(
              future: _activities.getRecords(),
              initialData: const [],
              builder: (context, snapshot) {
                return createLeadListView(context, snapshot);
              }),
        ),
      ]),
    );

  }

  Widget createLeadListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int index) {
        bool isSameDate = true;
        final String dateString = values[index].startDate;
        final DateTime date = DateTime.parse(dateString);
        if (index == 0) {
          isSameDate = false;
        } else {
          final String prevDateString = values[index - 1].startDate;
          final DateTime prevDate = DateTime.parse(prevDateString);
          isSameDate = date.isSameDate(prevDate);
        }
        if (index == 0 || !(isSameDate)) {
          return Column(children: [
            Text(date.formatDate()),
            listelement(values[index])
          ]);
        } else {
          return listelement(values[index]);
        }

      },
    );
  }

  Widget listelement(valueelemnt) {

    return GestureDetector(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: FlutterLogo(),
            title: Text(valueelemnt.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            subtitle:


            Text(
              (valueelemnt.phone!=null?valueelemnt.phone+'\n':'')+
                  (valueelemnt.position!=null?valueelemnt.position+'\n':''),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            trailing: Text(
              (valueelemnt.cLocationID!=null?valueelemnt.cLocationID.identifier+'\n':'')+
                  (valueelemnt.contactActivityType!=null?valueelemnt.contactActivityType.identifier+'\n':''),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

        ],
      ),
    );
  }


}
const String dateFormatter = 'MMMM dd, y';
extension DateHelper on DateTime {

  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
