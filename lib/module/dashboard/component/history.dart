// ignore_for_file: must_be_immutable

import 'package:contract_management/main.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  VoidCallback? onClose;

  HistoryScreen({super.key, this.onClose});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isExpanded = false;
  bool isExpandedSecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change log',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      },
                      child: const Icon(Icons.exit_to_app))
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: const [
                  Text(
                    'CONTRACT META DATA UPDATED',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'January 3',
                    style: TextStyle(fontSize: 18),
                  ), // Date
                  const Text(","),
                  const SizedBox(width: 2.0),
                  const Text('6:07 PM', style: TextStyle(fontSize: 18)), // Time
                  const SizedBox(width: 4.0),
                  const Text('by', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 6.0),
                  const Text('Sanjay K Kabra',
                      style: TextStyle(fontSize: 18)), // Name
                ],
              ),
              const SizedBox(height: 16.0),
              if (isExpanded)
                const Text(
                  'Contract Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 8.0),
              if (isExpanded)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0,
                      height: 230.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.black),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(187, 187, 187, 0.5)),
                              columns: const [
                                DataColumn(label: Text('Label')),
                                DataColumn(label: Text('Old Value')),
                                DataColumn(label: Text('New Value')),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('Contract Name')),
                                  DataCell(Text('Pearson performance testing')),
                                  DataCell(Text('Pearson Quality Testing')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Contract Type')),
                                  DataCell(Text('Sales')),
                                  DataCell(Text('Sales')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Potential Start Date')),
                                  DataCell(Text('22/02/23')),
                                  DataCell(Text('25/02/2023')),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16.0),
              if (isExpanded)
                const Text(
                  'Contract Compilance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 8.0),
              if (isExpanded)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0,
                      height: 170.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          const SizedBox(height: 8.0),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.black),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(187, 187, 187, 0.5)),
                              columns: const [
                                DataColumn(label: Text('Label')),
                                DataColumn(label: Text('Old Value')),
                                DataColumn(label: Text('New Value')),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('Project Name')),
                                  DataCell(Text('Pearson performance testing')),
                                  DataCell(Text('Pearson Quality Testing')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Project Type')),
                                  DataCell(Text('Sales')),
                                  DataCell(Text('Sales')),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16.0),
              Row(
                children: const [
                  Text(
                    'CONTRACT STATUS & META DATA UPDATED',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpandedSecond = !isExpandedSecond;
                      });
                    },
                    child: Icon(
                        isExpandedSecond
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'January 1',
                    style: TextStyle(fontSize: 18),
                  ), // Date
                  const Text(","),
                  const SizedBox(width: 2.0),
                  const Text('2:56 PM', style: TextStyle(fontSize: 18)), // Time
                  const SizedBox(width: 4.0),
                  const Text('by', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 6.0),
                  const Text('Sanjay K Kabra',
                      style: TextStyle(fontSize: 18)), // Name
                ],
              ),
              const SizedBox(height: 16.0),
              if (isExpandedSecond)
                const Text(
                  'Contract Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 8.0),
              if (isExpandedSecond)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0,
                      height: 230.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.black),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(187, 187, 187, 0.5)),
                              columns: const [
                                DataColumn(label: Text('Label')),
                                DataColumn(label: Text('Old Value')),
                                DataColumn(label: Text('New Value')),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('Contract Name')),
                                  DataCell(Text('Pearson performance testing')),
                                  DataCell(Text('Pearson Quality Testing')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Contract Type')),
                                  DataCell(Text('Sales')),
                                  DataCell(Text('Sales')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Potential Start Date')),
                                  DataCell(Text('22/02/23')),
                                  DataCell(Text('25/02/2023')),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16.0),
              if (isExpandedSecond)
                const Text(
                  'Contract Compilance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 8.0),
              if (isExpandedSecond)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0,
                      height: 170.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          const SizedBox(height: 8.0),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.black),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(187, 187, 187, 0.5)),
                              columns: const [
                                DataColumn(label: Text('Label')),
                                DataColumn(label: Text('Old Value')),
                                DataColumn(label: Text('New Value')),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('Project Name')),
                                  DataCell(Text('Pearson performance testing')),
                                  DataCell(Text('Pearson Quality Testing')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Project Type')),
                                  DataCell(Text('Sales')),
                                  DataCell(Text('Sales')),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
