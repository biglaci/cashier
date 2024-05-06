class order {
  int? pageCount;
  int? recordsSize;
  int? skipRecords;
  int? rowCount;
  int? arrayCount;
  List<Records>? records;

  order(
      {this.pageCount,
        this.recordsSize,
        this.skipRecords,
        this.rowCount,
        this.arrayCount,
        this.records});

  order.fromJson(Map<String, dynamic> json) {
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
  ADClientID? aDClientID;
  ADClientID? aDOrgID;
  bool? isActive;
  String? created;
  ADClientID? createdBy;
  String? updated;
  ADClientID? updatedBy;
  String? documentNo;
  DocStatus? docStatus;
  ADClientID? cDocTypeID;
  ADClientID? cDocTypeTargetID;
  String? description;
  bool? isApproved;
  bool? isCreditApproved;
  bool? isDelivered;
  bool? isInvoiced;
  bool? isPrinted;
  bool? isTransferred;
  String? dateOrdered;
  String? datePromised;
  String? dateAcct;
  ADClientID? salesRepID;
  ADClientID? cPaymentTermID;
  ADClientID? cCurrencyID;
  DocStatus? invoiceRule;
  int? freightAmt;
  DocStatus? deliveryViaRule;
  DocStatus? priorityRule;
  double? totalLines;
  double? grandTotal;
  ADClientID? mWarehouseID;
  ADClientID? mPriceListID;
  ADClientID? cBPartnerID;
  int? chargeAmt;
  bool? processed;
  ADClientID? cBPartnerLocationID;
  bool? isSOTrx;
  DocStatus? deliveryRule;
  DocStatus? freightCostRule;
  DocStatus? paymentRule;
  bool? isDiscountPrinted;
  bool? isTaxIncluded;
  bool? isSelected;
  ADClientID? cCashLineID;
  bool? sendEMail;
  ADClientID? billBPartnerID;
  ADClientID? billLocationID;
  bool? isSelfService;
  bool? isDropShip;
  int? processedOn;
  bool? isPayScheduleValid;
  bool? isPriviledgedRate;
  String? modelName;
  String? pOReference;
  ADClientID? aDUserID;
  ADClientID? cPaymentID;
  ADClientID? billUserID;
  ADClientID? cConversionTypeID;
  int? volume;
  int? weight;

  Records(
      {this.id,
        this.uid,
        this.aDClientID,
        this.aDOrgID,
        this.isActive,
        this.created,
        this.createdBy,
        this.updated,
        this.updatedBy,
        this.documentNo,
        this.docStatus,
        this.cDocTypeID,
        this.cDocTypeTargetID,
        this.description,
        this.isApproved,
        this.isCreditApproved,
        this.isDelivered,
        this.isInvoiced,
        this.isPrinted,
        this.isTransferred,
        this.dateOrdered,
        this.datePromised,
        this.dateAcct,
        this.salesRepID,
        this.cPaymentTermID,
        this.cCurrencyID,
        this.invoiceRule,
        this.freightAmt,
        this.deliveryViaRule,
        this.priorityRule,
        this.totalLines,
        this.grandTotal,
        this.mWarehouseID,
        this.mPriceListID,
        this.cBPartnerID,
        this.chargeAmt,
        this.processed,
        this.cBPartnerLocationID,
        this.isSOTrx,
        this.deliveryRule,
        this.freightCostRule,
        this.paymentRule,
        this.isDiscountPrinted,
        this.isTaxIncluded,
        this.isSelected,
        this.cCashLineID,
        this.sendEMail,
        this.billBPartnerID,
        this.billLocationID,
        this.isSelfService,
        this.isDropShip,
        this.processedOn,
        this.isPayScheduleValid,
        this.isPriviledgedRate,
        this.modelName,
        this.pOReference,
        this.aDUserID,
        this.cPaymentID,
        this.billUserID,
        this.cConversionTypeID,
        this.volume,
        this.weight});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    aDClientID = json['AD_Client_ID'] != null
        ? new ADClientID.fromJson(json['AD_Client_ID'])
        : null;
    aDOrgID = json['AD_Org_ID'] != null
        ? new ADClientID.fromJson(json['AD_Org_ID'])
        : null;
    isActive = json['IsActive'];
    created = json['Created'];
    createdBy = json['CreatedBy'] != null
        ? new ADClientID.fromJson(json['CreatedBy'])
        : null;
    updated = json['Updated'];
    updatedBy = json['UpdatedBy'] != null
        ? new ADClientID.fromJson(json['UpdatedBy'])
        : null;
    documentNo = json['DocumentNo'];
    docStatus = json['DocStatus'] != null
        ? new DocStatus.fromJson(json['DocStatus'])
        : null;
    cDocTypeID = json['C_DocType_ID'] != null
        ? new ADClientID.fromJson(json['C_DocType_ID'])
        : null;
    cDocTypeTargetID = json['C_DocTypeTarget_ID'] != null
        ? new ADClientID.fromJson(json['C_DocTypeTarget_ID'])
        : null;
    description = json['Description'];
    isApproved = json['IsApproved'];
    isCreditApproved = json['IsCreditApproved'];
    isDelivered = json['IsDelivered'];
    isInvoiced = json['IsInvoiced'];
    isPrinted = json['IsPrinted'];
    isTransferred = json['IsTransferred'];
    dateOrdered = json['DateOrdered'];
    datePromised = json['DatePromised'];
    dateAcct = json['DateAcct'];
    salesRepID = json['SalesRep_ID'] != null
        ? new ADClientID.fromJson(json['SalesRep_ID'])
        : null;
    cPaymentTermID = json['C_PaymentTerm_ID'] != null
        ? new ADClientID.fromJson(json['C_PaymentTerm_ID'])
        : null;
    cCurrencyID = json['C_Currency_ID'] != null
        ? new ADClientID.fromJson(json['C_Currency_ID'])
        : null;
    invoiceRule = json['InvoiceRule'] != null
        ? new DocStatus.fromJson(json['InvoiceRule'])
        : null;
    freightAmt = json['FreightAmt'];
    deliveryViaRule = json['DeliveryViaRule'] != null
        ? new DocStatus.fromJson(json['DeliveryViaRule'])
        : null;
    priorityRule = json['PriorityRule'] != null
        ? new DocStatus.fromJson(json['PriorityRule'])
        : null;
    totalLines = json['TotalLines'];
    grandTotal = json['GrandTotal'];
    mWarehouseID = json['M_Warehouse_ID'] != null
        ? new ADClientID.fromJson(json['M_Warehouse_ID'])
        : null;
    mPriceListID = json['M_PriceList_ID'] != null
        ? new ADClientID.fromJson(json['M_PriceList_ID'])
        : null;
    cBPartnerID = json['C_BPartner_ID'] != null
        ? new ADClientID.fromJson(json['C_BPartner_ID'])
        : null;
    chargeAmt = json['ChargeAmt'];
    processed = json['Processed'];
    cBPartnerLocationID = json['C_BPartner_Location_ID'] != null
        ? new ADClientID.fromJson(json['C_BPartner_Location_ID'])
        : null;
    isSOTrx = json['IsSOTrx'];
    deliveryRule = json['DeliveryRule'] != null
        ? new DocStatus.fromJson(json['DeliveryRule'])
        : null;
    freightCostRule = json['FreightCostRule'] != null
        ? new DocStatus.fromJson(json['FreightCostRule'])
        : null;
    paymentRule = json['PaymentRule'] != null
        ? new DocStatus.fromJson(json['PaymentRule'])
        : null;
    isDiscountPrinted = json['IsDiscountPrinted'];
    isTaxIncluded = json['IsTaxIncluded'];
    isSelected = json['IsSelected'];
    cCashLineID = json['C_CashLine_ID'] != null
        ? new ADClientID.fromJson(json['C_CashLine_ID'])
        : null;
    sendEMail = json['SendEMail'];
    billBPartnerID = json['Bill_BPartner_ID'] != null
        ? new ADClientID.fromJson(json['Bill_BPartner_ID'])
        : null;
    billLocationID = json['Bill_Location_ID'] != null
        ? new ADClientID.fromJson(json['Bill_Location_ID'])
        : null;
    isSelfService = json['IsSelfService'];
    isDropShip = json['IsDropShip'];
    processedOn = json['ProcessedOn'];
    isPayScheduleValid = json['IsPayScheduleValid'];
    isPriviledgedRate = json['IsPriviledgedRate'];
    modelName = json['model-name'];
    pOReference = json['POReference'];
    aDUserID = json['AD_User_ID'] != null
        ? new ADClientID.fromJson(json['AD_User_ID'])
        : null;
    cPaymentID = json['C_Payment_ID'] != null
        ? new ADClientID.fromJson(json['C_Payment_ID'])
        : null;
    billUserID = json['Bill_User_ID'] != null
        ? new ADClientID.fromJson(json['Bill_User_ID'])
        : null;
    cConversionTypeID = json['C_ConversionType_ID'] != null
        ? new ADClientID.fromJson(json['C_ConversionType_ID'])
        : null;
    volume = json['Volume'];
    weight = json['Weight'];
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
    data['IsActive'] = this.isActive;
    data['Created'] = this.created;
    if (this.createdBy != null) {
      data['CreatedBy'] = this.createdBy!.toJson();
    }
    data['Updated'] = this.updated;
    if (this.updatedBy != null) {
      data['UpdatedBy'] = this.updatedBy!.toJson();
    }
    data['DocumentNo'] = this.documentNo;
    if (this.docStatus != null) {
      data['DocStatus'] = this.docStatus!.toJson();
    }
    if (this.cDocTypeID != null) {
      data['C_DocType_ID'] = this.cDocTypeID!.toJson();
    }
    if (this.cDocTypeTargetID != null) {
      data['C_DocTypeTarget_ID'] = this.cDocTypeTargetID!.toJson();
    }
    data['Description'] = this.description;
    data['IsApproved'] = this.isApproved;
    data['IsCreditApproved'] = this.isCreditApproved;
    data['IsDelivered'] = this.isDelivered;
    data['IsInvoiced'] = this.isInvoiced;
    data['IsPrinted'] = this.isPrinted;
    data['IsTransferred'] = this.isTransferred;
    data['DateOrdered'] = this.dateOrdered;
    data['DatePromised'] = this.datePromised;
    data['DateAcct'] = this.dateAcct;
    if (this.salesRepID != null) {
      data['SalesRep_ID'] = this.salesRepID!.toJson();
    }
    if (this.cPaymentTermID != null) {
      data['C_PaymentTerm_ID'] = this.cPaymentTermID!.toJson();
    }
    if (this.cCurrencyID != null) {
      data['C_Currency_ID'] = this.cCurrencyID!.toJson();
    }
    if (this.invoiceRule != null) {
      data['InvoiceRule'] = this.invoiceRule!.toJson();
    }
    data['FreightAmt'] = this.freightAmt;
    if (this.deliveryViaRule != null) {
      data['DeliveryViaRule'] = this.deliveryViaRule!.toJson();
    }
    if (this.priorityRule != null) {
      data['PriorityRule'] = this.priorityRule!.toJson();
    }
    data['TotalLines'] = this.totalLines;
    data['GrandTotal'] = this.grandTotal;
    if (this.mWarehouseID != null) {
      data['M_Warehouse_ID'] = this.mWarehouseID!.toJson();
    }
    if (this.mPriceListID != null) {
      data['M_PriceList_ID'] = this.mPriceListID!.toJson();
    }
    if (this.cBPartnerID != null) {
      data['C_BPartner_ID'] = this.cBPartnerID!.toJson();
    }
    data['ChargeAmt'] = this.chargeAmt;
    data['Processed'] = this.processed;
    if (this.cBPartnerLocationID != null) {
      data['C_BPartner_Location_ID'] = this.cBPartnerLocationID!.toJson();
    }
    data['IsSOTrx'] = this.isSOTrx;
    if (this.deliveryRule != null) {
      data['DeliveryRule'] = this.deliveryRule!.toJson();
    }
    if (this.freightCostRule != null) {
      data['FreightCostRule'] = this.freightCostRule!.toJson();
    }
    if (this.paymentRule != null) {
      data['PaymentRule'] = this.paymentRule!.toJson();
    }
    data['IsDiscountPrinted'] = this.isDiscountPrinted;
    data['IsTaxIncluded'] = this.isTaxIncluded;
    data['IsSelected'] = this.isSelected;
    if (this.cCashLineID != null) {
      data['C_CashLine_ID'] = this.cCashLineID!.toJson();
    }
    data['SendEMail'] = this.sendEMail;
    if (this.billBPartnerID != null) {
      data['Bill_BPartner_ID'] = this.billBPartnerID!.toJson();
    }
    if (this.billLocationID != null) {
      data['Bill_Location_ID'] = this.billLocationID!.toJson();
    }
    data['IsSelfService'] = this.isSelfService;
    data['IsDropShip'] = this.isDropShip;
    data['ProcessedOn'] = this.processedOn;
    data['IsPayScheduleValid'] = this.isPayScheduleValid;
    data['IsPriviledgedRate'] = this.isPriviledgedRate;
    data['model-name'] = this.modelName;
    data['POReference'] = this.pOReference;
    if (this.aDUserID != null) {
      data['AD_User_ID'] = this.aDUserID!.toJson();
    }
    if (this.cPaymentID != null) {
      data['C_Payment_ID'] = this.cPaymentID!.toJson();
    }
    if (this.billUserID != null) {
      data['Bill_User_ID'] = this.billUserID!.toJson();
    }
    if (this.cConversionTypeID != null) {
      data['C_ConversionType_ID'] = this.cConversionTypeID!.toJson();
    }
    data['Volume'] = this.volume;
    data['Weight'] = this.weight;
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

class DocStatus {
  String? propertyLabel;
  String? id;
  String? identifier;
  String? modelName;

  DocStatus({this.propertyLabel, this.id, this.identifier, this.modelName});

  DocStatus.fromJson(Map<String, dynamic> json) {
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
