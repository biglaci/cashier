class SpkKnprVolnelokality {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  SpkKnprVolnelokality(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  SpkKnprVolnelokality.fromJson(Map<String, dynamic> json) {
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
  ReferenceID? aDOrgID;
  ReferenceID? aDClientID;
  String? created;
  ReferenceID? createdBy;
  bool? isActive;
  String? updated;
  ReferenceID? updatedBy;
  String? name;
  SpkMiestaTyp? spkMiestaTyp;
  String? modelName;

  Records(
      {this.id,
        this.uid,
        this.aDOrgID,
        this.aDClientID,
        this.created,
        this.createdBy,
        this.isActive,
        this.updated,
        this.updatedBy,
        this.name,
        this.spkMiestaTyp,
        this.modelName});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    aDOrgID = json['AD_Org_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Org_ID'])
        : null;
    aDClientID = json['AD_Client_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Client_ID'])
        : null;
    created = json['Created'];
    createdBy = json['CreatedBy'] != null
        ? new ReferenceID.fromJson(json['CreatedBy'])
        : null;
    isActive = json['IsActive'];
    updated = json['Updated'];
    updatedBy = json['UpdatedBy'] != null
        ? new ReferenceID.fromJson(json['UpdatedBy'])
        : null;
    name = json['Name'];
    spkMiestaTyp = json['spk_miesta_typ'] != null
        ? new SpkMiestaTyp.fromJson(json['spk_miesta_typ'])
        : null;
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    if (this.aDOrgID != null) {
      data['AD_Org_ID'] = this.aDOrgID!.toJson();
    }
    if (this.aDClientID != null) {
      data['AD_Client_ID'] = this.aDClientID!.toJson();
    }
    data['Created'] = this.created;
    if (this.createdBy != null) {
      data['CreatedBy'] = this.createdBy!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['Updated'] = this.updated;
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    data['Name'] = this.name;
    if (this.spkMiestaTyp != null) {
      data['spk_miesta_typ'] = this.spkMiestaTyp!.toJson();
    }
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

class SpkMiestaTyp {
  String? propertyLabel;
  String? id;
  String? identifier;
  String? modelName;

  SpkMiestaTyp({this.propertyLabel, this.id, this.identifier, this.modelName});

  SpkMiestaTyp.fromJson(Map<String, dynamic> json) {
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
