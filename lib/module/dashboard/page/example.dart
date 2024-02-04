import 'package:contract_management/module/dashboard/component/contract_table.dart';
import 'package:contract_management/module/dashboard/component/create_contact_button.dart';
import 'package:contract_management/module/dashboard/component/dropdown.dart';
import 'package:contract_management/module/dashboard/component/msa_vendor.dart';
import 'package:contract_management/module/dashboard/component/reusable_appbar.dart';
import 'package:contract_management/module/dashboard/component/widget_carousel.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0),
              child: ResponsiveRow(),
            ),
            SizedBox(
              child: Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomDropdownFilter()),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height > 960 ? 300 : 260,
                child: const AllContractSlider()),
            SizedBox(
              child: Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 8.0),
                      child: CustomDropdownFilter()),
                  Expanded(child: SelectCustomerType())
                ],
              ),
            ),
            const ContractDataTable()
          ],
        ),
      ),
    );
  }
}
