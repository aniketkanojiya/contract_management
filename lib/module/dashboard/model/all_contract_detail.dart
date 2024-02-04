class ContractModel {
  List<Approver>? approvers;
  List<Collaborator>? collaborators;
  ContractCompliance? contractCompliance;
  String? contractId;
  String? contractName;
  String? contractOwner;
  String? contractStatus;
  String? contractType;
  String? coreContractType;
  int? crmId;
  String? currency;
  int? customPaymentTerm;
  Customer? customer;
  String? description;
  String? du;
  String? effectiveFrom;
  String? expectedClosure;
  int? id;
  String? location;
  Owner? owner;
  String? paymentTerm;
  String? presalesPersonName;
  String? programManagerName;
  String? projectManagerName;
  bool? renewable;
  String? renewableDurations;
  List<Reviewer>? reviewers;
  String? salesPersonName;
  String? solutioningPersonName;
  String? strategicDu;
  String? subDu;
  int? totalContractValue;
  String? validTill;

  ContractModel({
    this.approvers,
    this.collaborators,
    this.contractCompliance,
    this.contractId,
    this.contractName,
    this.contractOwner,
    this.contractStatus,
    this.contractType,
    this.coreContractType,
    this.crmId,
    this.currency,
    this.customPaymentTerm,
    this.customer,
    this.description,
    this.du,
    this.effectiveFrom,
    this.expectedClosure,
    this.id,
    this.location,
    this.owner,
    this.paymentTerm,
    this.presalesPersonName,
    this.programManagerName,
    this.projectManagerName,
    this.renewable,
    this.renewableDurations,
    this.reviewers,
    this.salesPersonName,
    this.solutioningPersonName,
    this.strategicDu,
    this.subDu,
    this.totalContractValue,
    this.validTill,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      approvers: (json['approvers'] != null)
          ? List<Approver>.from(
              json['approvers'].map((x) => Approver.fromJson(x)))
          : null,
      collaborators: (json['collaborators'] != null)
          ? List<Collaborator>.from(
              json['collaborators'].map((x) => Collaborator.fromJson(x)))
          : null,
      contractCompliance: (json['contractCompliance'] != null)
          ? ContractCompliance.fromJson(json['contractCompliance'])
          : null,
      contractId: json['contractId'],
      contractName: json['contractName'],
      contractOwner: json['contractOwner'],
      contractStatus: json['contractStatus'],
      contractType: json['contractType'],
      coreContractType: json['coreContractType'],
      crmId: json['crmId'],
      currency: json['currency'],
      customPaymentTerm: json['customPaymentTerm'],
      customer: (json['customer'] != null)
          ? Customer.fromJson(json['customer'])
          : null,
      description: json['description'],
      du: json['du'],
      effectiveFrom: json['effectiveFrom'],
      expectedClosure: json['expectedClosure'],
      id: json['id'],
      location: json['location'],
      owner: (json['owner'] != null) ? Owner.fromJson(json['owner']) : null,
      paymentTerm: json['paymentTerm'],
      presalesPersonName: json['presalesPersonName'],
      programManagerName: json['programManagerName'],
      projectManagerName: json['projectManagerName'],
      renewable: json['renewable'],
      renewableDurations: json['renewableDurations'],
      reviewers: (json['reviewers'] != null)
          ? List<Reviewer>.from(
              json['reviewers'].map((x) => Reviewer.fromJson(x)))
          : null,
      salesPersonName: json['salesPersonName'],
      solutioningPersonName: json['solutioningPersonName'],
      strategicDu: json['strategicDu'],
      subDu: json['subDu'],
      totalContractValue: json['totalContractValue'],
      validTill: json['validTill'],
    );
  }
}

class Approver {
  String? approverEmailId;
  String? approverName;
  String? approverRole;
  int? userId;

  Approver({
    this.approverEmailId,
    this.approverName,
    this.approverRole,
    this.userId,
  });

  factory Approver.fromJson(Map<String, dynamic> json) {
    return Approver(
      approverEmailId: json['approverEmailId'],
      approverName: json['approverName'],
      approverRole: json['approverRole'],
      userId: json['userId'],
    );
  }
}

class Collaborator {
  String? collaboratorEmailId;
  String? collaboratorName;
  String? collaboratorRole;
  int? userId;

  Collaborator({
    this.collaboratorEmailId,
    this.collaboratorName,
    this.collaboratorRole,
    this.userId,
  });

  factory Collaborator.fromJson(Map<String, dynamic> json) {
    return Collaborator(
      collaboratorEmailId: json['collaboratorEmailId'],
      collaboratorName: json['collaboratorName'],
      collaboratorRole: json['collaboratorRole'],
      userId: json['userId'],
    );
  }
}

class ContractCompliance {
  int? confidentialityAndNonDisclosureBreach;
  DataBreachNoticePeriod? dataBreachNoticePeriod;
  int? dataPrivacyBreachHrs;
  String? governingLaw;
  int? intellectualPropertyBreach;
  String? intellectualPropertyRights;
  bool? latePaymentCheck;
  int? latePaymentFees;
  int? terminationNotice;
  TerminationNoticePeriod? terminationNoticePeriod;
  String? warrantiesAndRepresentations;

  ContractCompliance({
    this.confidentialityAndNonDisclosureBreach,
    this.dataBreachNoticePeriod,
    this.dataPrivacyBreachHrs,
    this.governingLaw,
    this.intellectualPropertyBreach,
    this.intellectualPropertyRights,
    this.latePaymentCheck,
    this.latePaymentFees,
    this.terminationNotice,
    this.terminationNoticePeriod,
    this.warrantiesAndRepresentations,
  });

  factory ContractCompliance.fromJson(Map<String, dynamic> json) {
    return ContractCompliance(
      confidentialityAndNonDisclosureBreach:
          json['confidentialityAndNonDisclosureBreach'],
      dataBreachNoticePeriod:
          DataBreachNoticePeriod.fromJson(json['dataBreachNoticePeriod']),
      dataPrivacyBreachHrs: json['dataPrivacyBreachHrs'],
      governingLaw: json['governingLaw'],
      intellectualPropertyBreach: json['intellectualPropertyBreach'],
      intellectualPropertyRights: json['intellectualPropertyRights'],
      latePaymentCheck: json['latePaymentCheck'],
      latePaymentFees: json['latePaymentFees'],
      terminationNotice: json['terminationNotice'],
      terminationNoticePeriod:
          TerminationNoticePeriod.fromJson(json['terminationNoticePeriod']),
      warrantiesAndRepresentations: json['warrantiesAndRepresentations'],
    );
  }
}

class DataBreachNoticePeriod {
  int? days;
  int? months;
  int? weeks;

  DataBreachNoticePeriod({
    this.days,
    this.months,
    this.weeks,
  });

  factory DataBreachNoticePeriod.fromJson(Map<String, dynamic> json) {
    return DataBreachNoticePeriod(
      days: json['days'],
      months: json['months'],
      weeks: json['weeks'],
    );
  }
}

class TerminationNoticePeriod {
  int? days;
  int? months;
  int? weeks;

  TerminationNoticePeriod({
    this.days,
    this.months,
    this.weeks,
  });

  factory TerminationNoticePeriod.fromJson(Map<String, dynamic> json) {
    return TerminationNoticePeriod(
      days: json['days'],
      months: json['months'],
      weeks: json['weeks'],
    );
  }
}

class Customer {
  String? customerName;
  String? email;
  String? location;
  String? phoneNo;

  Customer({
    this.customerName,
    this.email,
    this.location,
    this.phoneNo,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerName: json['customerName'],
      email: json['email'],
      location: json['location'],
      phoneNo: json['phoneNo'],
    );
  }
}

class Owner {
  String? ownerEmailId;
  String? ownerName;
  String? ownerRole;
  int? userId;

  Owner({
    this.ownerEmailId,
    this.ownerName,
    this.ownerRole,
    this.userId,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      ownerEmailId: json['ownerEmailId'],
      ownerName: json['ownerName'],
      ownerRole: json['ownerRole'],
      userId: json['userId'],
    );
  }
}

class Reviewer {
  String? reviewerEmailId;
  String? reviewerName;
  String? reviewerRole;
  int? userId;

  Reviewer({
    this.reviewerEmailId,
    this.reviewerName,
    this.reviewerRole,
    this.userId,
  });

  factory Reviewer.fromJson(Map<String, dynamic> json) {
    return Reviewer(
      reviewerEmailId: json['reviewerEmailId'],
      reviewerName: json['reviewerName'],
      reviewerRole: json['reviewerRole'],
      userId: json['userId'],
    );
  }
}
