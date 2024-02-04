// class ContractSearchModel {
//   final String assignedTo;
//   final String contractId;
//   final String contractName;
//   final bool contractRedFlagged;
//   final String contractStatus;
//   final String contractType;
//   final String coreContractType;
//   final String documentLink;
//   final DateTime? expectedClosureDate;
//   final DateTime? expirationDate;
//   final int id;
//   final String linkedContracts;
//   final String location;
//   final String owner;
//   final double totalContractValue;
//   final String userRole;

//   ContractSearchModel({
//     required this.assignedTo,
//     required this.contractId,
//     required this.contractName,
//     required this.contractRedFlagged,
//     required this.contractStatus,
//     required this.contractType,
//     required this.coreContractType,
//     required this.documentLink,
//     required this.expectedClosureDate,
//     required this.expirationDate,
//     required this.id,
//     required this.linkedContracts,
//     required this.location,
//     required this.owner,
//     required this.totalContractValue,
//     required this.userRole,
//   });

//   factory ContractSearchModel.fromJson(Map<String, dynamic> json) {
//     return ContractSearchModel(
//       assignedTo: json['assignedTo'] ?? '',
//       contractId: json['contractId'] ?? '',
//       contractName: json['contractName'] ?? '',
//       contractRedFlagged: json['contractRedFlagged'] ?? false,
//       contractStatus: json['contractStatus'] ?? '',
//       contractType: json['contractType'] ?? '',
//       coreContractType: json['coreContractType'] ?? '',
//       documentLink: json['documentLink'] ?? '',
//       expectedClosureDate: json['expectedClosureDate'] != null
//           ? DateTime.parse(json['expectedClosureDate'])
//           : null,
//       expirationDate: json['expirationDate'] != null
//           ? DateTime.parse(json['expirationDate'])
//           : null,
//       id: json['id'] ?? 0,
//       linkedContracts: json['linkedContracts'] ?? '',
//       location: json['location'] ?? '',
//       owner: json['owner'] ?? '',
//       totalContractValue: json['totalContractValue'] ?? 0,
//       userRole: json['userRole'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'assignedTo': assignedTo,
//       'contractId': contractId,
//       'contractName': contractName,
//       'contractRedFlagged': contractRedFlagged,
//       'contractStatus': contractStatus,
//       'contractType': contractType,
//       'coreContractType': coreContractType,
//       'documentLink': documentLink,
//       'expectedClosureDate': expectedClosureDate?.toIso8601String(),
//       'expirationDate': expirationDate?.toIso8601String(),
//       'id': id,
//       'linkedContracts': linkedContracts,
//       'location': location,
//       'owner': owner,
//       'totalContractValue': totalContractValue,
//       'userRole': userRole,
//     };
//   }
// }

class ContractSearchModel {
  final String assignedTo;
  final String contractId;
  final String contractName;
  final bool contractRedFlagged;
  final String contractStatus;
  final String contractType;
  final String coreContractType;
  final String documentLink;
  final String expectedClosureDate;
  final String expirationDate;
  final int id;
  final int linkedContracts;
  final String location;
  final String owner;
  final double totalContractValue; // Change type to double
  final String userRole;

  ContractSearchModel({
    required this.assignedTo,
    required this.contractId,
    required this.contractName,
    required this.contractRedFlagged,
    required this.contractStatus,
    required this.contractType,
    required this.coreContractType,
    required this.documentLink,
    required this.expectedClosureDate,
    required this.expirationDate,
    required this.id,
    required this.linkedContracts,
    required this.location,
    required this.owner,
    required this.totalContractValue,
    required this.userRole,
  });

  factory ContractSearchModel.fromJson(Map<String, dynamic> json) {
    return ContractSearchModel(
      assignedTo: json['assignedTo'] ?? 'Not Assigned',
      contractId: json['contractId'] ?? '',
      contractName: json['contractName'] ?? '',
      contractRedFlagged: json['contractRedFlagged'] ?? false,
      contractStatus: json['contractStatus'] ?? '',
      contractType: json['contractType'] ?? '',
      coreContractType: json['coreContractType'] ?? '',
      documentLink: json['documentLink'] ?? '',
      expectedClosureDate: json['expectedClosureDate'] ?? '',
      expirationDate: json['expirationDate'] ?? '',
      id: json['id'] ?? 0,
      linkedContracts: json['linkedContracts'] ?? 0,
      location: json['location'] ?? 'No Location',
      owner: json['owner'] ?? 'No Owner',
      totalContractValue:
          (json['totalContractValue'] ?? 0).toDouble(), // Convert to double
      userRole: json['userRole'] ?? '',
    );
  }
}
