import 'package:flutter/material.dart';

class CustomDropdownFilter extends StatefulWidget {
  const CustomDropdownFilter({super.key});

  @override
  _CustomDropdownFilterState createState() => _CustomDropdownFilterState();
}

class _CustomDropdownFilterState extends State<CustomDropdownFilter> {
  String selectedOption = 'Option 1';
  List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 600 ? 250 : 150,
      height: MediaQuery.of(context).size.width > 600 ? 40 : 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: selectedOption,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 4,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}












// REUSABLE COMPONENT

// import 'package:flutter/material.dart';

// class CustomDropdownFilter extends StatefulWidget {
//   final List<String> options;
//   final String selectedOption;
//   final Function(String?) onChanged;

//   const CustomDropdownFilter({
//     required this.options,
//     required this.selectedOption,
//     required this.onChanged,
//   });

//   @override
//   _CustomDropdownFilterState createState() => _CustomDropdownFilterState();
// }

// class _CustomDropdownFilterState extends State<CustomDropdownFilter> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 30,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: DropdownButtonHideUnderline(
//         child: ButtonTheme(
//           alignedDropdown: true,
//           child: DropdownButton<String>(
//             value: widget.selectedOption,
//             icon: Icon(Icons.arrow_drop_down),
//             iconSize: 24,
//             elevation: 4,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//             onChanged: widget.onChanged,
//             items: widget.options.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Text(value),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
