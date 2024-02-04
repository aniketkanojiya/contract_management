// import 'package:contract_management/module/dashboard/component/contract_table.dart';
// import 'package:contract_management/module/dashboard/model/all_contract_detail.dart';
// import 'package:contract_management/module/dashboard/network/api.dart';
// import 'package:flutter/material.dart';

// class TableView extends StatelessWidget {
//   Future<List<ContractModel>> _fetchContractsData() async {
//     return fetchContracts(); // Implement your contract data fetching logic
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ContractModel>>(
//       future: _fetchContractsData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (snapshot.hasData) {
//           return ContractDataTable(contracts: snapshot.data!);
//         } else {
//           return const Center(child: Text('No contracts available'));
//         }
//       },
//     );
//   }
// }

