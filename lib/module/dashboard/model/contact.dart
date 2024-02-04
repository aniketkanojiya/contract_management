import 'dart:convert';
import 'package:http/http.dart' as http;

class Contract {
  String? assignedTo;
  String contractId;
  String contractName;
  bool contractRedFlagged;
  String contractStatus;
  String contractType;
  String coreContractType;
  DateTime expectedClosureDate;
  DateTime expirationDate;
  int id;
  String? linkedContracts;
  String? location;
  String? owner;
  int totalContractValue;
  String? userRole;

  Contract({
    this.assignedTo,
    required this.contractId,
    required this.contractName,
    required this.contractRedFlagged,
    required this.contractStatus,
    required this.contractType,
    required this.coreContractType,
    required this.expectedClosureDate,
    required this.expirationDate,
    required this.id,
    this.linkedContracts,
    this.location,
    this.owner,
    required this.totalContractValue,
    this.userRole,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      assignedTo: json['assignedTo'] ?? "N/A",
      contractId: json['contractId'],
      contractName: json['contractName'],
      contractRedFlagged: json['contractRedFlagged'],
      contractStatus: json['contractStatus'],
      contractType: json['contractType'],
      coreContractType: json['coreContractType'],
      expectedClosureDate: DateTime.parse(json['expectedClosureDate']),
      expirationDate: DateTime.parse(json['expirationDate']),
      id: json['id'],
      linkedContracts: json['linkedContracts'] ?? "N/A",
      location: json['location'] ?? "N/A",
      owner: json['owner'] ?? "N/A",
      totalContractValue: json['totalContractValue'],
      userRole: json['userRole'] ?? "N/A",
    );
  }
}
