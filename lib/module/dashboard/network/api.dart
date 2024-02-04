import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart' as http;

import 'package:contract_management/module/dashboard/model/search.dart';

class ContractSearchProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDataLoaded = false;
  bool _arrowDirection = false;
  List<ContractSearchModel> _searchResults = [];
  List<ContractSearchModel> _tableResults = [];
  List<ContractSearchModel> _widgetResults = [];

  bool get isLoading => _isLoading;
  bool get isDataLoaded => _isDataLoaded;
  bool get arrowDirection => _arrowDirection;
  List<ContractSearchModel> get searchResults => _searchResults;
  List<ContractSearchModel> get tableResults => _tableResults;
  List<ContractSearchModel> get widgetResults => _widgetResults;

  void setIsDataLoaded(bool loaded) {
    _isDataLoaded = loaded;
    notifyListeners();
  }

  // Searching Contracts
  Future<void> searchContracts(String query) async {
    _isLoading = true;
    String url;

    if (query.isEmpty) {
      url =
          'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3';
    } else {
      url =
          'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3?searchTerm=${Uri.encodeComponent(query)}';
    }

    try {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      http.IOClient client = http.IOClient(httpClient);

      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        _searchResults = (jsonDecode(jsonData) as List<dynamic>)
            .map((contractJson) => ContractSearchModel.fromJson(contractJson))
            .toList();
        _widgetResults = List.from(_searchResults);
        _tableResults = List.from(_searchResults);
        _isLoading = false;
        notifyListeners();
      } else {
        // throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  // Sorting Contracts
  Future<void> sortContracts(String sortDirection, String sortField) async {
    String role = 'owner';
    String sortUrl =
        'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3?sortDirection=$sortDirection&sortField=$sortField&role=$role';

    try {
      final httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      http.IOClient client = http.IOClient(httpClient);

      final response = await client.get(Uri.parse(sortUrl));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        _tableResults = (jsonDecode(jsonData) as List<dynamic>)
            .map((contractJson) => ContractSearchModel.fromJson(contractJson))
            .toList();

        _isLoading = false;
        _arrowDirection = !_arrowDirection;
        notifyListeners();
      } else {
        // throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}




















// import 'dart:convert';
// import 'dart:io';
// import 'package:contract_management/module/dashboard/model/search.dart';
// import 'package:flutter/material.dart';
// import 'package:http/io_client.dart' as http;

// class ContractSearchProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   bool _isDataLoaded = false;
//   List<ContractSearchModel> _searchResults = [];

//   bool get isLoading => _isLoading;
//   bool get isDataLoaded => _isDataLoaded;
//   List<ContractSearchModel> get searchResults => _searchResults;

//   void setIsDataLoaded(bool loaded) {
//     _isDataLoaded = loaded;
//     notifyListeners();
//   }

//   searchContracts(String query) async {
//     _isLoading = true;
//     String url;

//     if (query.isEmpty) {
//       url =
//           'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3';
//     } else {
//       url =
//           'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3?searchTerm=$query';
//     }
//     try {
//       final httpClient = HttpClient();
//       httpClient.badCertificateCallback =
//           ((X509Certificate cert, String host, int port) => true);
//       http.IOClient client = http.IOClient(httpClient);

//       final response = await client.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final jsonData = response.body;
//         _searchResults = (jsonDecode(jsonData) as List)
//             .map((contractJson) => ContractSearchModel.fromJson(contractJson))
//             .toList();

//         _isLoading = false;
//         notifyListeners();
//       } else {
//         // throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       throw (Exception(e.toString()));
//     }
//   }

//   sortContracts(String sortDirection, String sortField) async{
//      String role = 'owner';
//     String sortUrl = 'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/searchSortFilterContractsv3?sortDirection=$sortDirection&sortField=$sortField&role=$role';
//     try {
//       final httpClient = HttpClient();
//       httpClient.badCertificateCallback =
//           ((X509Certificate cert, String host, int port) => true);
//       http.IOClient client = http.IOClient(httpClient);

//       final response = client.get(Uri.parse(sortUrl));

//       if (response.statusCode == 200) {
//         final jsonData = await response.body;
//         _searchResults = (jsonDecode(jsonData) as List)
//             .map((contractJson) => ContractSearchModel.fromJson(contractJson))
//             .toList();

//         _isLoading = false;
//         notifyListeners();
//       } else {
//         // throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       throw (Exception(e.toString()));
//     }

//   }
// }


















//gets draft contracts only

// Future<List<Contract>> fetchDataFromAPI() async {
//   List<Contract> contracts = [];
//   HttpClient httpClient = HttpClient();
//   httpClient.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);
//   http.IOClient client = http.IOClient(httpClient);

//   final response = await client.get(Uri.parse(
//       'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v2/contracts/contracts'));

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = jsonDecode(response.body);
//     contracts = jsonData.map((item) => Contract.fromJson(item)).toList();
//     return contracts;
//   } else {
//     throw Exception('Failed to fetch data');
//   }
// }

// gets all contracts

// Future<List<ContractModel>> fetchV1Contracts() async {
//   List<ContractModel> contracts = [];
//   HttpClient httpClient = HttpClient();
//   httpClient.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);
//   http.IOClient client = http.IOClient(httpClient);
//   final response = await client.get(
//     Uri.parse(
//         'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v1/contracts/contracts'),
//   );

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = jsonDecode(response.body);
//     contracts = jsonData.map((item) => ContractModel.fromJson(item)).toList();
//     return contracts;
//   } else {
//     throw Exception('Failed to fetch contracts');
//   }
// }

// Future<List<ContractModel>> fetchContracts() async {
//   final httpClient = HttpClient();
//   httpClient.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);

//   const url =
//       'https://contract-management-alb-1712110721.ap-south-1.elb.amazonaws.com/v1/contracts/contracts';
//   final uri = Uri.parse(url);

//   try {
//     final request = await httpClient.getUrl(uri);
//     final response = await request.close();

//     if (response.statusCode == HttpStatus.ok) {
//       final jsonData = await response.transform(utf8.decoder).join();
//       final contractData = json.decode(jsonData) as List<dynamic>;

//       List<ContractModel> contracts = contractData.map((data) {
//         return ContractModel.fromJson(data);
//       }).toList();

//       return contracts;
//     } else {
//       throw Exception('Failed to fetch contracts');
//     }
//   } catch (e) {
//     throw Exception('Failed to establish a connection to the API');
//   } finally {
//     httpClient.close();
//   }
// }
