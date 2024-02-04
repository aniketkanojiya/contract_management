import 'package:contract_management/module/dashboard/component/widget_carousel.dart';
import 'package:contract_management/module/dashboard/page/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contract_management/module/dashboard/component/reusable_appbar.dart';

void main() {
  testWidgets('MyWidget should contain MyAppBar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyWidget(),
      ),
    );

    // Verify that MyAppBar is present in MyWidget
    expect(find.byType(MyAppBar), findsOneWidget);
  });

  testWidgets('MyWidget should contain MyGridView wrapped in a SizedBox',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyWidget(),
      ),
    );

    // Verify that MyGridView is present in MyWidget wrapped in a SizedBox
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(AllContractSlider), findsOneWidget);
  });

  testWidgets('MyWidget should adjust SizedBox height based on MediaQuery',
      (WidgetTester tester) async {
    final double screenHeight = 960;
    final double greaterHeight = screenHeight + 100;
    final double lesserHeight = screenHeight - 100;

    // Testing when MediaQuery height is greater than the threshold
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: Size(800, greaterHeight),
          ),
          child: MyWidget(),
        ),
      ),
    );
    expect(find.byType(SizedBox), findsOneWidget);
    final sizedBox1 = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox1.height, 300);

    // Testing when MediaQuery height is lesser than the threshold
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: Size(800, lesserHeight),
          ),
          child: MyWidget(),
        ),
      ),
    );
    expect(find.byType(SizedBox), findsOneWidget);
    final sizedBox2 = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox2.height, 260);
  });
}
