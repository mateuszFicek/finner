import 'package:finner/common/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomTextButton displays icon', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomTextButton(
            onTap: () {},
            title: 'Hello',
            outlined: true,
            icon: Icons.abc,
          ),
        ),
      ),
    ));

    final titleFinder = find.byType(Icon);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('CustomTextButton has title', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomTextButton(
            onTap: () {},
            title: 'Hello',
          ),
        ),
      ),
    ));

    final titleFinder = find.text("Hello");
    expect(titleFinder, findsOneWidget);
  });
}
