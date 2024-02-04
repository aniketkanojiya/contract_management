import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contract_management/module/dashboard/network/api.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final network = Provider.of<ContractSearchProvider>(context, listen: false);

    return Container(
      width: MediaQuery.of(context).size.width > 600 ? 300 : 150,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _searchTextController,
        onChanged: (value) {
          if (value.isEmpty) {
            network.searchContracts(value);
          }
          // Update search text in provider
        },
        onSubmitted: (value) {
          final searchQuery = value.trim();
          network.searchContracts(searchQuery);
          FocusScope.of(context).unfocus(); // Close the keyboard
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}















//STATIC CODE



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:contract_management/module/dashboard/network/api.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final network = Provider.of<ContractSearchProvider>(context, listen: false);
//     final searchText = TextEditingController();

//     return Container(
//       width: MediaQuery.of(context).size.width > 600 ? 300 : 150,
//       height: 50,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1),
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 16.0),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: TextField(
//         controller: searchText,
//         onChanged: (value) {
//           searchText.value = searchText.value.copyWith(
//             text: value,
//             selection: TextSelection.collapsed(offset: value.length),
//           );

//           network.searchContracts(value);
//         },
//         onSubmitted: (value) {
//           final searchQuery = searchText.text.trim();
//           network.searchContracts(searchQuery);
//           FocusScope.of(context).unfocus(); // Close the keyboard
//         },
//         decoration: const InputDecoration(
//           hintText: 'Search',
//           border: InputBorder.none,
//           icon: Icon(Icons.search),
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   SearchBar({super.key});
//   TextEditingController searchText = TextEditingController();
//   Network network = Network();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width > 600 ? 300 : 150,
//       height: 50,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1),
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 16.0),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: TextField(
//         controller: searchText,
//         onChanged: (value) {

//           network.searchContracts(network.query = value);
//         },
//         onSubmitted: (value) {
//           final searchQuery = searchText.text.trim();
//           network.searchContracts(network.query = searchQuery);
//         },
//         decoration: InputDecoration(
//             hintText: 'Search',
//             border: InputBorder.none,
//             icon: Icon(
//               Icons.search,
//             )),
//       ),
//     );
//   }
// }

