class SpkKnprVolneznacky {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  SpkKnprVolneznacky(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  SpkKnprVolneznacky.fromJson(Map<String, dynamic> json) {
    pageCount = json['page-count'];
    recordsSize = json['records-size'];
    skipRecords = json['skip-records'];
    rowCount = json['row-count'];
    arrayCount = json['array-count'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page-count'] = this.pageCount;
    data['records-size'] = this.recordsSize;
    data['skip-records'] = this.skipRecords;
    data['row-count'] = this.rowCount;
    data['array-count'] = this.arrayCount;
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  int? id;
  String? uid;
  String? name;
  String? modelName;

  Records({this.id, this.uid, this.name, this.modelName});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['Name'];
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['Name'] = this.name;
    data['model-name'] = this.modelName;
    return data;
  }
}
