import 'package:finner/common/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> showTestStatus(WidgetTester tester) async {
    NavigatorState navigator = tester.state(find.byType(Navigator));
    CustomSnackBar.show("Hello", navigator.context);
  }

  testWidgets('CustomSnackBar displayes message', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(),
    ));

    showTestStatus(tester);
    await tester.pump(const Duration(seconds: 1));

    final titleFinder = find.text("Hello");
    expect(titleFinder, findsOneWidget);
  });
}
