class Activity  {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  Activity(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  Activity.fromJson(Map<String, dynamic> json) {
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
  ReferenceID? aDClientID;
  ReferenceID? aDOrgID;
  String? updated;
  ReferenceID? updatedBy;
  String? created;
  ReferenceID? createdBy;
  bool? isActive;
  String? name;
  String? phone;
  String? eMail;
  String? position;
  ContactActivityType? contactActivityType;
  String? description;
  String? startDate;
  String? endDate;
  String? comments;
  ReferenceID? aDUserID;
  ReferenceID? cContactActivityID;
  String? modelName;
  ReferenceID? cLocationID;

  Records(
      {this.id,
        this.aDClientID,
        this.aDOrgID,
        this.updated,
        this.updatedBy,
        this.created,
        this.createdBy,
        this.isActive,
        this.name,
        this.phone,
        this.eMail,
        this.position,
        this.contactActivityType,
        this.description,
        this.startDate,
        this.endDate,
        this.comments,
        this.aDUserID,
        this.cContactActivityID,
        this.modelName,
        this.cLocationID});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aDClientID = json['AD_Client_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Client_ID'])
        : null;
    aDOrgID = json['AD_Org_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Org_ID'])
        : null;
    updated = json['Updated'];
    updatedBy = json['UpdatedBy'] != null
        ? new ReferenceID.fromJson(json['UpdatedBy'])
        : null;
    created = json['Created'];
    createdBy = json['CreatedBy'] != null
        ? new ReferenceID.fromJson(json['CreatedBy'])
        : null;
    isActive = json['IsActive'];
    name = json['Name'];
    phone = json['Phone'];
    eMail = json['EMail'];
    position = json['Position'];
    contactActivityType = json['ContactActivityType'] != null
        ? new ContactActivityType.fromJson(json['ContactActivityType'])
        : null;
    description = json['Description'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    comments = json['Comments'];
    aDUserID = json['AD_User_ID'] != null
        ? new ReferenceID.fromJson(json['AD_User_ID'])
        : null;
    cContactActivityID = json['C_ContactActivity_ID'] != null
        ? new ReferenceID.fromJson(json['C_ContactActivity_ID'])
        : null;
    modelName = json['model-name'];
    cLocationID = json['C_Location_ID'] != null
        ? new ReferenceID.fromJson(json['C_Location_ID'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.aDClientID != null) {
      data['AD_Client_ID'] = this.aDClientID!.toJson();
    }
    if (this.aDOrgID != null) {
      data['AD_Org_ID'] = this.aDOrgID!.toJson();
    }
    data['Updated'] = this.updated;
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    data['Created'] = this.created;
    if (this.createdBy != null) {
      data['CreatedBy'] = this.createdBy!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['EMail'] = this.eMail;
    data['Position'] = this.position;
    if (this.contactActivityType != null) {
      data['ContactActivityType'] = this.contactActivityType!.toJson();
    }
    data['Description'] = this.description;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Comments'] = this.comments;
    if (this.aDUserID != null) {
      data['AD_User_ID'] = this.aDUserID!.toJson();
    }
    if (this.cContactActivityID != null) {
      data['C_ContactActivity_ID'] = this.cContactActivityID!.toJson();
    }
    data['model-name'] = this.modelName;
    if (this.cLocationID != null) {
      data['C_Location_ID'] = this.cLocationID!.toJson();
    }
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

class ContactActivityType {
  String? propertyLabel;
  String? id;
  String? identifier;
  String? modelName;

  ContactActivityType(
      {this.propertyLabel, this.id, this.identifier, this.modelName});

  ContactActivityType.fromJson(Map<String, dynamic> json) {
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
