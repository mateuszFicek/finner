import 'package:finner/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomTextField', (tester) async {
    final textController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomTextField(
            controller: textController,
            hint: "Hello",
          ),
        ),
      ),
    ));

    final titleFinder = find.text("Hello");
    expect(titleFinder, findsOneWidget);
  });
}
