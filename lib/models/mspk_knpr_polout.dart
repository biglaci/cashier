class mspk_knpr_polout {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  mspk_knpr_polout(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  mspk_knpr_polout.fromJson(Map<String, dynamic> json) {
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
  String? spkKnprLokality;
  String? spkKnpnDatum;
  String? spkKnpnDatumPlan;
  String? name;
  ADClientID? aDClientID;
  ADClientID? aDOrgID;
  ADClientID? createdBy;
  ADClientID? updatedBy;
  String? created;
  String? updated;
  bool? isActive;
  bool? processed;
  String? spkKnprPolovoutUu;
  String? name2;
  String? modelName;

  Records(
      {this.id,
        this.spkKnprLokality,
        this.spkKnpnDatum,
        this.spkKnpnDatumPlan,
        this.name,
        this.aDClientID,
        this.aDOrgID,
        this.createdBy,
        this.updatedBy,
        this.created,
        this.updated,
        this.isActive,
        this.processed,
        this.spkKnprPolovoutUu,
        this.name2,
        this.modelName});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    spkKnprLokality = json['spk_knpr_lokality'];
    spkKnpnDatum = json['spk_knpn_datum'];
    spkKnpnDatumPlan = json['spk_knpn_datum_plan'];
    name = json['Name'];
    aDClientID = json['AD_Client_ID'] != null
        ? new ADClientID.fromJson(json['AD_Client_ID'])
        : null;
    aDOrgID = json['AD_Org_ID'] != null
        ? new ADClientID.fromJson(json['AD_Org_ID'])
        : null;
    createdBy = json['CreatedBy'] != null
        ? new ADClientID.fromJson(json['CreatedBy'])
        : null;
    updatedBy = json['UpdatedBy'] != null
        ? new ADClientID.fromJson(json['UpdatedBy'])
        : null;
    created = json['Created'];
    updated = json['Updated'];
    isActive = json['IsActive'];
    processed = json['Processed'];
    spkKnprPolovoutUu = json['spk_knpr_polovout_uu'];
    name2 = json['Name2'];
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['spk_knpr_lokality'] = this.spkKnprLokality;
    data['spk_knpn_datum'] = this.spkKnpnDatum;
    data['spk_knpn_datum_plan'] = this.spkKnpnDatumPlan;
    data['Name'] = this.name;
    if (this.aDClientID != null) {
      data['AD_Client_ID'] = this.aDClientID!.toJson();
    }
    if (this.aDOrgID != null) {
      data['AD_Org_ID'] = this.aDOrgID!.toJson();
    }
    if (this.createdBy != null) {
      data['CreatedBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    data['Created'] = this.created;
    data['Updated'] = this.updated;
    data['IsActive'] = this.isActive;
    data['Processed'] = this.processed;
    data['spk_knpr_polovout_uu'] = this.spkKnprPolovoutUu;
    data['Name2'] = this.name2;
    data['model-name'] = this.modelName;
    return data;
  }
}

class ADClientID {
  String? propertyLabel;
  int? id;
  String? identifier;
  String? modelName;

  ADClientID({this.propertyLabel, this.id, this.identifier, this.modelName});

  ADClientID.fromJson(Map<String, dynamic> json) {
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
