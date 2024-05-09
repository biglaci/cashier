class SpkKnprUcel {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  SpkKnprUcel(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  SpkKnprUcel.fromJson(Map<String, dynamic> json) {
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
  ReferenceID? aDClientID;
  ReferenceID? aDOrgID;
  String? created;
  bool? isActive;
  String? name;
  String? updated;
  int? sequence;
  String? modelName;

  Records(
      {this.id,
        this.uid,
        this.aDClientID,
        this.aDOrgID,
        this.created,
        this.isActive,
        this.name,
        this.updated,
        this.sequence,
        this.modelName});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    aDClientID = json['AD_Client_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Client_ID'])
        : null;
    aDOrgID = json['AD_Org_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Org_ID'])
        : null;
    created = json['Created'];
    isActive = json['IsActive'];
    name = json['Name'];
    updated = json['Updated'];
    sequence = json['Sequence'];
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    if (this.aDClientID != null) {
      data['AD_Client_ID'] = this.aDClientID!.toJson();
    }
    if (this.aDOrgID != null) {
      data['AD_Org_ID'] = this.aDOrgID!.toJson();
    }
    data['Created'] = this.created;
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    data['Updated'] = this.updated;
    data['Sequence'] = this.sequence;
    data['model-name'] = this.modelName;
    return data;
  }
}

class ReferenceID {
  String? propertyLabel;
  int? id;
  String? identifier;
  String? modelName;

  ReferenceID({this.propertyLabel, this.id, this.identifier, this.modelName});

  ReferenceID.fromJson(Map<String, dynamic> json) {
    propertyLabel = json['propertyLabel'];
    id = json['id'];
    identifier = json['identifier'];
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyLabel'] = this.propertyLabel;
    data['id'] = this.id;
    data['identifier'] = this.identifier;
    data['model-name'] = this.modelName;
    return data;
  }
}
