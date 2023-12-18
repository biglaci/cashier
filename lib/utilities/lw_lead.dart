import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/po.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class POList {
  POList({
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

  List<DataColumn> _columnList = [];
  List<DataRow> _rowList = [];
  List<Po> _polist = [];

  List<DataColumn> get columnList => _columnList;

  List<DataRow> get rowList => _rowList;

  List<Po> get polist => _polist;

  void _addColumns() {
    for (var i = 0; i < columns.length; i++) {
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    };
  }
//***********************

}
  class _Dessert {
  _Dessert(
  this.name,     // The name of the dessert
  this.calories, // The number of calories in the dessert
  this.fat,      // The amount of fat in the dessert (in grams)
  );

  final String name;     // The name of the dessert (immutable)
  final int calories;    // The number of calories in the dessert (immutable)
  final String fat;      // The amount of fat in the dessert (in grams) (immutable)
  bool selected = false; // Whether the dessert is currently selected (default is false)

  }

  class DessertDataSource extends DataTableSource {
  // Constructor for _DessertDataSource class, takes a BuildContext argument
    List<DataRow> _rowList = [];


    DessertDataSource(this.context)  {
      _desserts = getRecords() as List<_Dessert>;
  }

    Future<List<_Dessert>> getRecords() async {
    List<_Dessert>  _dessertsPO =[];
    List<Po> _polist = [];
    Future<List<Po>> records = IdempiereClient().get<Po>(
        '/model/ad_user', (json) => Po(json),
        orderBy: ['Name'],
        select: ['Name', 'ID', 'Phone'],
        top: 10,
        skip: 2,
        showsql: true);
    _polist = await records;
    for (var i = 0; i < _polist.length; i++) {

      _dessertsPO.add(_Dessert(
        _polist[i].json_po['Name'],
        _polist[i].json_po['ID'],
        _polist[i].json_po['Phone'],
      ) );
       // _rowList.add(DataRow(cells: getCells(_polist[i])));

    }
    return _dessertsPO;
  }

  // The BuildContext passed to the constructor
  final BuildContext context;
  int _selectedCount = 0;

  // List of desserts
  late List<_Dessert> _desserts;

// Get a DataRow for a given index
    @override
    DataRow? getRow(int index) {
      // Number formatter for percentages
      final format = NumberFormat.decimalPercentPattern(
        decimalDigits: 0,
      );
      // Make sure index is valid
      assert(index >= 0);
      if (index >= _desserts.length) return null;
      final dessert = _desserts[index];
      // Create the DataRow with cells for each dessert property
      return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (value) {
          // Update the selected count and dessert selection
          if (dessert.selected != value) {
            _selectedCount += value! ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        cells: [
          DataCell(Text(dessert.name)),
          DataCell(Text('${dessert.calories}')),
          DataCell(Text(dessert.fat)),
        ],
      );
    }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _desserts.length;

  @override
  int get selectedRowCount => _selectedCount;


}


