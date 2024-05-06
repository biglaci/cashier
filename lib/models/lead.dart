class lead {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  lead(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  lead.fromJson(Map<String, dynamic> json) {
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
  ReferenceID? aDClientID;
  ReferenceID? aDOrgID;
  bool? isActive;
  String? created;
  ReferenceID? createdBy;
  String? updated;
  ReferenceID? updatedBy;
  ReferenceID? cBPartnerID;
  String? lastResult;
  String? lastContact;
  NotificationType? notificationType;
  bool? isFullBPAccess;
  String? value;
  bool? isInPayroll;
  bool? isSalesLead;
  bool? isLocked;
  int? failedLoginCount;
  bool? isNoPasswordReset;
  bool? isExpired;
  bool? isAddMailTextAutomatically;
  bool? isNoExpire;
  bool? isSupportUser;
  bool? isShipTo;
  bool? isBillTo;
  bool? isVendorLead;
  String? modelName;
  String? description;
  String? eMail;
  ReferenceID? supervisorID;
  ReferenceID? salesRepID;
  String? birthday;
  String? phone;
  ReferenceID? cJobID;
  String? bPName;
  ReferenceID? cGreetingID;
  String? title;
  String? datePasswordChanged;
  String? dateLastLogin;

  Records(
      { this.id,
         this.uid,
         this.name,
         this.aDClientID,
         this.aDOrgID,
         this.isActive,
         this.created,
         this.createdBy,
         this.updated,
         this.updatedBy,
        this.cBPartnerID,
        this.lastResult,
        this.lastContact,
        this.notificationType,
        this.isFullBPAccess,
         this.value,
        this.isInPayroll,
        this.isSalesLead,
        this.isLocked,
        this.failedLoginCount,
        this.isNoPasswordReset,
        this.isExpired,
        this.isAddMailTextAutomatically,
        this.isNoExpire,
        this.isSupportUser,
        this.isShipTo,
        this.isBillTo,
        this.isVendorLead,
        this.modelName,
        this.description,
        this.eMail,
        this.supervisorID,
        this.salesRepID,
        this.birthday,
        this.phone,
        this.cJobID,
        this.bPName,
        this.cGreetingID,
        this.title,
        this.datePasswordChanged,
        this.dateLastLogin});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['Name'];
    aDClientID = (json['AD_Client_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Client_ID'])
        : null)!;
    aDOrgID = (json['AD_Org_ID'] != null
        ? new ReferenceID.fromJson(json['AD_Org_ID'])
        : null)!;
    isActive = json['IsActive'];
    created = json['Created'];
    createdBy = (json['CreatedBy'] != null
        ? new ReferenceID.fromJson(json['CreatedBy'])
        : null)!;
    updated = json['Updated'];
    updatedBy = (json['UpdatedBy'] != null
        ? new ReferenceID.fromJson(json['UpdatedBy'])
        : null)!;
    cBPartnerID = json['C_BPartner_ID'] != null
        ? new ReferenceID.fromJson(json['C_BPartner_ID'])
        : null;
    lastResult = json['LastResult'];
    lastContact = json['LastContact'];
    notificationType = json['NotificationType'] != null
        ? new NotificationType.fromJson(json['NotificationType'])
        : null;
    isFullBPAccess = json['IsFullBPAccess'];
    value = json['Value'];
    isInPayroll = json['IsInPayroll'];
    isSalesLead = json['IsSalesLead'];
    isLocked = json['IsLocked'];
    failedLoginCount = json['FailedLoginCount'];
    isNoPasswordReset = json['IsNoPasswordReset'];
    isExpired = json['IsExpired'];
    isAddMailTextAutomatically = json['IsAddMailTextAutomatically'];
    isNoExpire = json['IsNoExpire'];
    isSupportUser = json['IsSupportUser'];
    isShipTo = json['IsShipTo'];
    isBillTo = json['IsBillTo'];
    isVendorLead = json['IsVendorLead'];
    modelName = json['model-name'];
    description = json['Description'];
    eMail = json['EMail'];
    supervisorID = json['Supervisor_ID'] != null
        ? new ReferenceID.fromJson(json['Supervisor_ID'])
        : null;
    salesRepID = json['SalesRep_ID'] != null
        ? new ReferenceID.fromJson(json['SalesRep_ID'])
        : null;
    birthday = json['Birthday'];
    phone = json['Phone'];
    cJobID = json['C_Job_ID'] != null
        ? new ReferenceID.fromJson(json['C_Job_ID'])
        : null;
    bPName = json['BPName'];
    cGreetingID = json['C_Greeting_ID'] != null
        ? new ReferenceID.fromJson(json['C_Greeting_ID'])
        : null;
    title = json['Title'];
    datePasswordChanged = json['DatePasswordChanged'];
    dateLastLogin = json['DateLastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['Name'] = this.name;
    if (this.aDClientID != null) {
      data['AD_Client_ID'] = this.aDClientID!.toJson();
    }
    if (this.aDOrgID != null) {
      data['AD_Org_ID'] = this.aDOrgID!.toJson();
    }
    data['IsActive'] = this.isActive;
    data['Created'] = this.created;
    if (this.createdBy != null) {
      data['CreatedBy'] = this.createdBy!.toJson();
    }
    data['Updated'] = this.updated;
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    if (this.cBPartnerID != null) {
      data['C_BPartner_ID'] = this.cBPartnerID!.toJson();
    }
    data['LastResult'] = this.lastResult;
    data['LastContact'] = this.lastContact;
    if (this.notificationType != null) {
      data['NotificationType'] = this.notificationType!.toJson();
    }
    data['IsFullBPAccess'] = this.isFullBPAccess;
    data['Value'] = this.value;
    data['IsInPayroll'] = this.isInPayroll;
    data['IsSalesLead'] = this.isSalesLead;
    data['IsLocked'] = this.isLocked;
    data['FailedLoginCount'] = this.failedLoginCount;
    data['IsNoPasswordReset'] = this.isNoPasswordReset;
    data['IsExpired'] = this.isExpired;
    data['IsAddMailTextAutomatically'] = this.isAddMailTextAutomatically;
    data['IsNoExpire'] = this.isNoExpire;
    data['IsSupportUser'] = this.isSupportUser;
    data['IsShipTo'] = this.isShipTo;
    data['IsBillTo'] = this.isBillTo;
    data['IsVendorLead'] = this.isVendorLead;
    data['model-name'] = this.modelName;
    data['Description'] = this.description;
    data['EMail'] = this.eMail;
    if (this.supervisorID != null) {
      data['Supervisor_ID'] = this.supervisorID!.toJson();
    }
    if (this.salesRepID != null) {
      data['SalesRep_ID'] = this.salesRepID!.toJson();
    }
    data['Birthday'] = this.birthday;
    data['Phone'] = this.phone;
    if (this.cJobID != null) {
      data['C_Job_ID'] = this.cJobID!.toJson();
    }
    data['BPName'] = this.bPName;
    if (this.cGreetingID != null) {
      data['C_Greeting_ID'] = this.cGreetingID!.toJson();
    }
    data['Title'] = this.title;
    data['DatePasswordChanged'] = this.datePasswordChanged;
    data['DateLastLogin'] = this.dateLastLogin;
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

class NotificationType {
  String? propertyLabel;
  String? id;
  String? identifier;
  String? modelName;

  NotificationType(
      {this.propertyLabel, this.id, this.identifier, this.modelName});

  NotificationType.fromJson(Map<String, dynamic> json) {
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
