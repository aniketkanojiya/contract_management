import 'package:contract_management/module/dashboard/component/history.dart';
import 'package:contract_management/module/dashboard/model/search.dart';
import 'package:contract_management/module/dashboard/network/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractDataTable extends StatefulWidget {
  const ContractDataTable({Key? key}) : super(key: key);

  @override
  _ContractDataTableState createState() => _ContractDataTableState();
}

class _ContractDataTableState extends State<ContractDataTable> {
  bool _isShow = false;
  List<ContractSearchModel> contracts = [];
  int displayedRowCount = 15; // Number of initial rows to display
  bool isLoading = false; // Flag to track if new data is being loaded
  String sortDirection = 'asc';
  String sortField = 'contractName';

  void handleSwipeGesture(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 0) {
      setState(() {
        displayedRowCount += 10; // Increase the number of rows to display
      });
    }
  }

  Future<void> loadMoreData() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Simulate loading delay
    await Future.delayed(const Duration(microseconds: 50));

    setState(() {
      displayedRowCount += 10; // Increase the number of rows to display
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContractSearchProvider>(
      builder: (BuildContext context, contractSearchProvider, _) {
        if (contractSearchProvider.tableResults.isEmpty) {
          if (contractSearchProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('No contracts available'));
          }
        } else {
          contracts = contractSearchProvider.tableResults;
          final filteredContracts = contracts.take(displayedRowCount).toList();
          return Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {
                  loadMoreData();
                }
                return false;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onVerticalDragEnd: handleSwipeGesture,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          DataTable(
                            dividerThickness: 8.0,
                            columnSpacing: 50.0,
                            dataRowHeight: 70,
                            columns: [
                              DataColumn(
                                  label: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isShow = !_isShow;
                                    contractSearchProvider.searchContracts('');
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'Contract ID',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isShow,
                                      child: IconButton(
                                        onPressed: () {
                                          contractSearchProvider.sortContracts(
                                              contractSearchProvider
                                                      .arrowDirection
                                                  ? 'asc'
                                                  : 'desc',
                                              'contractId');
                                        },
                                        icon: contractSearchProvider
                                                .arrowDirection
                                            ? const Icon(Icons.arrow_upward)
                                            : const Icon(Icons.arrow_downward),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              DataColumn(
                                  label: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isShow = !_isShow;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'Contract Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isShow,
                                      child: IconButton(
                                        onPressed: () {
                                          contractSearchProvider.sortContracts(
                                              contractSearchProvider
                                                      .arrowDirection
                                                  ? 'asc'
                                                  : 'desc',
                                              'contractName');
                                        },
                                        icon: contractSearchProvider
                                                .arrowDirection
                                            ? const Icon(Icons.arrow_upward)
                                            : const Icon(Icons.arrow_downward),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              const DataColumn(
                                label: Text(
                                  'Category',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  'Owner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  'Assigned To',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                  label: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isShow = !_isShow;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'TCV',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isShow,
                                      child: IconButton(
                                        onPressed: () {
                                          contractSearchProvider.sortContracts(
                                              contractSearchProvider
                                                      .arrowDirection
                                                  ? 'asc'
                                                  : 'desc',
                                              'totalContractValue');
                                        },
                                        icon: contractSearchProvider
                                                .arrowDirection
                                            ? const Icon(Icons.arrow_upward)
                                            : const Icon(Icons.arrow_downward),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              const DataColumn(
                                label: Text(
                                  'Location',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                  label: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isShow = !_isShow;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'Expected\nClosure Date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isShow,
                                      child: IconButton(
                                        onPressed: () {
                                          contractSearchProvider.sortContracts(
                                              contractSearchProvider
                                                      .arrowDirection
                                                  ? 'asc'
                                                  : 'desc',
                                              'expectedClosure');
                                        },
                                        icon: contractSearchProvider
                                                .arrowDirection
                                            ? const Icon(Icons.arrow_upward)
                                            : const Icon(Icons.arrow_downward),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              DataColumn(
                                  label: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isShow = !_isShow;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'Expiration Date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isShow,
                                      child: IconButton(
                                        onPressed: () {
                                          contractSearchProvider.sortContracts(
                                              contractSearchProvider
                                                      .arrowDirection
                                                  ? 'asc'
                                                  : 'desc',
                                              'validTill');
                                        },
                                        icon: contractSearchProvider
                                                .arrowDirection
                                            ? const Icon(Icons.arrow_upward)
                                            : const Icon(Icons.arrow_downward),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              const DataColumn(
                                label: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  'Action',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                            rows: filteredContracts.map((contract) {
                              return DataRow(
                                color: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFF6F8F9),
                                ),
                                cells: [
                                  DataCell(
                                    Text(
                                      contract.contractId ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(contract.contractName)),
                                  DataCell(Text(
                                      "${contract.coreContractType}\n(${contract.contractType})")),
                                  DataCell(Text(contract.owner)),
                                  DataCell(Text(contract.assignedTo)),
                                  DataCell(Text(
                                      contract.totalContractValue.toString())),
                                  DataCell(Text(contract.location)),
                                  DataCell(
                                    Text(
                                      contract.expectedClosureDate,
                                      style: const TextStyle(
                                          color: Colors.redAccent),
                                    ),
                                  ),
                                  DataCell(Text(contract.expirationDate)),
                                  DataCell(
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        minimumSize: const Size(100.0, 30.0),
                                      ),
                                      child: Text(
                                        contract.contractStatus ?? '',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        const Icon(Icons.remove_red_eye),
                                        const SizedBox(width: 8.0),
                                        const Icon(Icons.edit),
                                        const SizedBox(width: 8.0),
                                        InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    child: HistoryScreen(),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(Icons.more_vert)),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                          if (isLoading)
                            Positioned.fill(
                              child: Container(
                                color: Colors.black38,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}





//  OLD CODE

// import 'package:contract_management/module/dashboard/model/search.dart';
// import 'package:contract_management/module/dashboard/network/api.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ContractDataTable extends StatefulWidget {
//   const ContractDataTable({Key? key}) : super(key: key);

//   @override
//   _ContractDataTableState createState() => _ContractDataTableState();
// }

// class _ContractDataTableState extends State<ContractDataTable> {
//   List<ContractSearchModel> contracts = [];
//   int displayedRowCount = 15; // Number of initial rows to display
//   bool isLoading = false; // Flag to track if new data is being loaded

//   void handleSwipeGesture(DragEndDetails details) {
//     if (details.velocity.pixelsPerSecond.dy > 0) {
//       setState(() {
//         displayedRowCount += 10; // Increase the number of rows to display
//       });
//     }
//   }

//   Future<void> loadMoreData() async {
//     if (isLoading) {
//       return;
//     }

//     setState(() {
//       isLoading = true;
//     });

//     // Simulate loading delay
//     await Future.delayed(const Duration(microseconds: 50));

//     setState(() {
//       displayedRowCount += 10; // Increase the number of rows to display
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ContractSearchProvider>(
//       builder: (BuildContext context, contractSearchProvider, _) {
//         if (contractSearchProvider.searchResults.isEmpty) {
//           if (contractSearchProvider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return const Center(child: Text('No contracts available'));
//           }
//         } else {
//           contracts = contractSearchProvider.searchResults;
//           final filteredContracts = contracts.take(displayedRowCount).toList();
//           return Expanded(
//             child: NotificationListener<ScrollNotification>(
//               onNotification: (notification) {
//                 if (notification is ScrollEndNotification &&
//                     notification.metrics.extentAfter == 0) {
//                   loadMoreData();
//                 }
//                 return false;
//               },
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: GestureDetector(
//                     onVerticalDragEnd: handleSwipeGesture,
//                     child: Theme(
//                       data: Theme.of(context).copyWith(
//                         dividerColor: Colors.white,
//                       ),
//                       child: Stack(
//                         children: [
//                           DataTable(
//                             dividerThickness: 8.0,
//                             columnSpacing: 50.0,
//                             dataRowHeight: 70,
//                             columns: const [
//                               DataColumn(
//                                 label: Text(
//                                   'Contract Id',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(

//                                 label: Text(
//                                   'Contract Name',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Category',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Owner',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Assigned To',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'TCV',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Location',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Expected\nClosure Date',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Expiration Date',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Status',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                             rows: filteredContracts.map((contract) {
//                               return DataRow(
//                                 color: MaterialStateColor.resolveWith(
//                                     (states) => const Color(0xFFF6F8F9)),
//                                 cells: [
//                                   DataCell(
//                                     Text(
//                                       contract.contractId ?? '',
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   DataCell(Text(contract.contractName)),
//                                   DataCell(Text(
//                                       "${contract.coreContractType}\n(${contract.contractType})")),
//                                   DataCell(Text(contract.owner)),
//                                   DataCell(Text(contract.assignedTo)),
//                                   DataCell(Text(
//                                       contract.totalContractValue.toString())),
//                                   DataCell(Text(contract.location)),
//                                   DataCell(
//                                     Text(
//                                       contract.expectedClosureDate,
//                                       style: const TextStyle(
//                                           color: Colors.redAccent),
//                                     ),
//                                   ),
//                                   DataCell(Text(contract.expirationDate)),
//                                   DataCell(
//                                     ElevatedButton(
//                                       onPressed: () {},
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.blue[900],
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(4.0),
//                                         ),
//                                         minimumSize: const Size(100.0, 30.0),
//                                       ),
//                                       child: Text(
//                                         contract.contractStatus ?? '',
//                                         style: const TextStyle(
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }).toList(),
//                           ),
//                           if (isLoading)
//                             Positioned.fill(
//                               child: Container(
//                                 color: Colors.black38,
//                                 child: const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }










//  STATIC CODE

// import 'package:contract_management/module/dashboard/model/search.dart';
// import 'package:flutter/material.dart';

// class ContractDataTable extends StatelessWidget {
//   final List<ContractSearchModel> contracts;

//   ContractDataTable({required this.contracts});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Theme(
//             data: Theme.of(context).copyWith(
//               dividerColor: Colors.white,
//             ),
//             child: DataTable(
//               dividerThickness: 3.0,
//               columnSpacing: 50.0,
//               columns: const [
//                 DataColumn(
//                   label: Text(
//                     'Contract Id',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Contract Name',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Category',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Owner',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Assigned To',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'TCV',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Location',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Expected\nClosure Date',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Expiration Date',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Status',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//               ],
//               rows: contracts.map((contract) {
//                 return DataRow(
//                   color: MaterialStateColor.resolveWith(
//                       (states) => Color(0xFFF6F8F9)),
//                   cells: [
//                     DataCell(
//                       Text(
//                         contract.contractId ?? '',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     DataCell(Text(contract.contractName)),
//                     DataCell(Text(
//                         "${contract.coreContractType}\n(${contract.contractType})")),
//                     DataCell(Text(contract.owner)),
//                     DataCell(Text(contract.assignedTo)),
//                     DataCell(Text(contract.totalContractValue.toString())),
//                     DataCell(Text(contract.location)),
//                     DataCell(Text(contract.expectedClosureDate)),
//                     DataCell(Text(contract.expirationDate)),
//                     DataCell(
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue[900],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                           ),
//                           minimumSize: Size(100.0, 30.0),
//                         ),
//                         child: Text(
//                           contract.contractStatus ?? '',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



