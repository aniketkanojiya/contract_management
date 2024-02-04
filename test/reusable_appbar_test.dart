import 'package:contract_management/module/dashboard/component/reusable_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyAppBar should build an AppBar with correct components',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: MyAppBar(),
        ),
      ),
    );

    // Verify that AppBar is present
    expect(find.byType(AppBar), findsOneWidget);

    // Verify AppBar background color
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, Colors.blue[900]);

    // Verify leading icon
    final leadingIcon = find.byIcon(Icons.person);
    expect(leadingIcon, findsOneWidget);

    // Verify search container
    final searchContainer = find.byType(Container);
    expect(searchContainer, findsOneWidget);

    // Verify search text field
    final searchTextField = find.byType(TextField);
    expect(searchTextField, findsOneWidget);

    // Verify menu icon
    final menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
  });
}
