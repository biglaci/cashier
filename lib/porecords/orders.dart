import 'package:flutter/material.dart';
import '../../models/morder.dart';
import '../idempiere_rest/idempiere_client.dart';
import 'package:intl/intl.dart';
class orders   {
  orders(this.context, {
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
  morder? data;
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
    this.data = morder.fromJson(mJson);
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
    this.data = morder.fromJson(mJson);
    _leadlist = this.data!.records!;
    return _leadlist;
  }

  void _addColumns() {
    for (var i = 0; i < columns.length; i++) {
      _columnList.insert(i, DataColumn(label: Text(columns[i])));
    };
  }
  final BuildContext context;

  // List of desserts
  late List<Records> _orders;

  // Sort the desserts by a given field
  void _sort<T>(Comparable<T> Function(Records d) getField, bool ascending) {
    _orders.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  // Number of selected desserts
  int _selectedCount = 0;

  // Update the selected desserts
  void updateSelectedDesserts(RestorableOrderSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < _orders.length; i += 1) {
      var order = _orders[i];
      if (selectedRows.isSelected(i)) {
        order.isActive = true;
        _selectedCount += 1;
      } else {
        order.isActive = false;
      }
    }
    notifyListeners();
  }

  // Get a DataRow for a given index
  @override
  DataRow? getRow(int index) {
    // Number formatter for percentages
    final format = NumberFormat.decimalPercentPattern(
      decimalDigits: 0,
    );
    // Make sure index is valid
    assert(index >= 0);
    if (index >= _orders.length) return null;
    final record_order = _orders[index];
    // Create the DataRow with cells for each dessert property
    return DataRow.byIndex(
      index: index,
      selected: true, //record_order.isActives
      onSelectChanged: (value) {
        // Update the selected count and dessert selection
        if (record_order.isActive != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          record_order.isActive = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(valStr(record_order.documentNo))),
        DataCell(Text(valDouble(record_order.grandTotal))),
        DataCell(Text(valStr(record_order.cDocTypeID?.identifier))),
        DataCell(Text(valStr(record_order.dateOrdered))),
        DataCell(Text(valStr(record_order.cBPartnerID?.identifier))),
        DataCell(Text(valStr(record_order.mWarehouseID?.identifier))),
        DataCell(Text(valStr(record_order.mPriceListID?.identifier))),
      ],
    );
  }


  // Number of rows in the DataTable
  @override
  int get rowCount => _orders.length;

  // Whether or not the rowCount is approximate
  @override
  bool get isRowCountApproximate => false;

  // Number of selected rows
  @override
  int get selectedRowCount => _selectedCount;

  // Select or deselect all rows
  void _selectAll(bool? checked) {
    for (final recordOrder in _orders) {
      recordOrder.isActive = checked ?? false;
    }
    _selectedCount = checked! ? _orders.length : 0;
    notifyListeners();
  }

  String valStr(String? inputString) {
    if (inputString==null){
      return "";
    } else {
      return inputString;
    }

  }

  String valDouble(double? inputDouble) {
    if (inputDouble==null){
      return "0";
    } else {
      return inputDouble.toString();
    }
  }

  void notifyListeners() {}

}

class RestorableOrderSelections extends RestorableProperty<Set<int>> {
  // The set of indices of selected dessert rows
  Set<int> _orderSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _orderSelections.contains(index);

  /// Takes a list of [_Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDessertSelections(List<Records> orderRecords) {
    final updatedSet = <int>{};
    for (var i = 0; i < orderRecords.length; i += 1) {
      var order = orderRecords[i];
      if (order.isActive!=null && order?.isActive==true ) {
        updatedSet.add(i);
      }
    }
    _orderSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _orderSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _orderSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _orderSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _orderSelections = value;
  }

  @override
  Object toPrimitives() => _orderSelections.toList();
}