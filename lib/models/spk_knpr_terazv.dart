class SpkKnprTerazv {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  SpkKnprTerazv(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  SpkKnprTerazv.fromJson(Map<String, dynamic> json) {
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
  String? updated;
 ReferenceID? updatedBy;
  bool? isActive;
  String? name;
  String? spkKnprLokalitytxt;
 ReferenceID? spkKnprUcelID;
  String? spkKnpnDatum;
  String? spkKnpnDatumPlan;
  int? spkPocHos;
  String? spkKnprHostxt;
  int? spkPocPoz;
  String? spkKnprPoztxt;
  int? spkPocUlo;
  String? spkKnprUlotxt;
  String? modelName;

  Records(
      {this.id,
        this.uid,
        this.aDOrgID,
        this.aDClientID,
        this.created,
        this.createdBy,
        this.updated,
        this.updatedBy,
        this.isActive,
        this.name,
        this.spkKnprLokalitytxt,
        this.spkKnprUcelID,
        this.spkKnpnDatum,
        this.spkKnpnDatumPlan,
        this.spkPocHos,
        this.spkKnprHostxt,
        this.spkPocPoz,
        this.spkKnprPoztxt,
        this.spkPocUlo,
        this.spkKnprUlotxt,
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
    updated = json['Updated'];
    updatedBy = json['UpdatedBy'] != null
        ? new ReferenceID.fromJson(json['UpdatedBy'])
        : null;
    isActive = json['IsActive'];
    name = json['Name'];
    spkKnprLokalitytxt = json['spk_knpr_lokalitytxt'];
    spkKnprUcelID = json['spk_knpr_ucel_ID'] != null
        ? new ReferenceID.fromJson(json['spk_knpr_ucel_ID'])
        : null;
    spkKnpnDatum = json['spk_knpn_datum'];
    spkKnpnDatumPlan = json['spk_knpn_datum_plan'];
    spkPocHos = json['spk_poc_hos'];
    spkKnprHostxt = json['spk_knpr_hostxt'];
    spkPocPoz = json['spk_poc_poz'];
    spkKnprPoztxt = json['spk_knpr_poztxt'];
    spkPocUlo = json['spk_poc_ulo'];
    spkKnprUlotxt = json['spk_knpr_ulotxt'];
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
    data['Updated'] = this.updated;
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    data['spk_knpr_lokalitytxt'] = this.spkKnprLokalitytxt;
    if (this.spkKnprUcelID != null) {
      data['spk_knpr_ucel_ID'] = this.spkKnprUcelID!.toJson();
    }
    data['spk_knpn_datum'] = this.spkKnpnDatum;
    data['spk_knpn_datum_plan'] = this.spkKnpnDatumPlan;
    data['spk_poc_hos'] = this.spkPocHos;
    data['spk_knpr_hostxt'] = this.spkKnprHostxt;
    data['spk_poc_poz'] = this.spkPocPoz;
    data['spk_knpr_poztxt'] = this.spkKnprPoztxt;
    data['spk_poc_ulo'] = this.spkPocUlo;
    data['spk_knpr_ulotxt'] = this.spkKnprUlotxt;
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
