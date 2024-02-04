import 'package:contract_management/module/dashboard/component/search_bar.dart';
import 'package:flutter/material.dart';

class ResponsiveRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SearchBar(),
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blue[900], borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {
              // Create new contact button action
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Create New Contract',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
