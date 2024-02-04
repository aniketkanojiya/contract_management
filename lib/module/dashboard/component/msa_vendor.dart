import 'package:flutter/material.dart';

class SelectCustomerType extends StatelessWidget {
  const SelectCustomerType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
          onPressed: () {},
          child: const Text(
            "Customer",
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4404BF),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          )),
      TextButton(
          onPressed: () {},
          child: const Text(
            "Vendor",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ))
    ]);
  }
}
