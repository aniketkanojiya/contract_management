import 'package:contract_management/module/dashboard/component/contract_widget.dart';
import 'package:contract_management/module/dashboard/network/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllContractSlider extends StatefulWidget {
  const AllContractSlider({
    super.key,
  });

  @override
  _AllContractSliderState createState() => _AllContractSliderState();
}

class _AllContractSliderState extends State<AllContractSlider> {
  final ScrollController _scrollController = ScrollController();
  int displayedItemCount = 5; // Number of initial items to display

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        handleSwipeGesture();
      }
    });
  }

  void handleSwipeGesture() {
    setState(() {
      displayedItemCount += 5; // Increase the number of items to display
    });
  }

  @override
  Widget build(BuildContext context) {
    final contractSearchProvider = Provider.of<ContractSearchProvider>(context);

    // Load data only once initially
    if (!contractSearchProvider.isDataLoaded) {
      contractSearchProvider.searchContracts('').then((_) {
        contractSearchProvider.setIsDataLoaded(true);
      });
    }

    return Consumer<ContractSearchProvider>(
      builder: (BuildContext context, contractSearchProvider, _) {
        if (contractSearchProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (contractSearchProvider.widgetResults.isEmpty) {
          return const Center(child: Text('No contracts available'));
        } else {
          // Display the search results
          var data = contractSearchProvider.widgetResults;
          return ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: displayedItemCount <= data.length
                ? displayedItemCount
                : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: UpdatedCustomContainer(
                  title: data[index].contractName,
                  category:
                      "${data[index].coreContractType}  (${data[index].contractType})",
                  dueDate: data[index].expirationDate,
                  closureDate: data[index].expectedClosureDate,
                  owner: data[index].owner,
                  location: data[index].location,
                  assignedTo: data[index].assignedTo,
                  contractStatus: data[index].contractStatus,
                ),
              );
            },
          );
        }
      },
    );
  }
}














// STATIC CODE

// import 'package:contract_management/module/dashboard/component/contract_widget.dart';
// import 'package:contract_management/module/dashboard/model/all_contract_detail.dart';
// import 'package:contract_management/module/dashboard/model/contact.dart';
// import 'package:contract_management/module/dashboard/network/api.dart';
// import 'package:flutter/material.dart';

// class AllContractSlider extends StatefulWidget {
//   const AllContractSlider({super.key});

//   @override
//   State<AllContractSlider> createState() => _AllContractSliderState();
// }

// class _AllContractSliderState extends State<AllContractSlider> {
//   Future<List<ContractModel>> _fetchContractsData() async {
//     return fetchContracts(); // Implement your contract data fetching logic
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _fetchContractsData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (snapshot.hasData) {
//           var data = snapshot.data;
//           return GridView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal, // Set horizontal scrolling
//             itemCount: snapshot.data!.length, // Number of containers
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 childAspectRatio: 5 / 6 // Show one container per row
//                 ),
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: UpdatedCustomContainer(
//                     title: data![index].contractName ?? "No Name",
//                     category:
//                         "${data[index].coreContractType}  (${data[index].contractType})",
//                     dueDate: data[index].validTill ?? "No Date",
//                     closureDate: data[index].expectedClosure ?? "No Date",
//                     owner: data[index].owner?.ownerName ?? "No Owner",
//                     location: data[index].location ?? "No Location",
//                     assignedTo: "Not Assigned",
//                     contractStatus: data[index].contractStatus ?? "No Status",
//                   ));
//             },
//           );
//         } else {
//           return const Center(child: Text('No contracts available'));
//         }
//       },
//     );
//   }
// }


