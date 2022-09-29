import 'package:finner/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomButton', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CustomButton(
        onTap: () {},
        title: 'Hello',
      ),
    ));

    final titleFinder = find.text("Hello");
    expect(titleFinder, findsOneWidget);
  });
}
