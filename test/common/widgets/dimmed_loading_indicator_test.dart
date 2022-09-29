import 'package:finner/common/widgets/dimmed_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DimmedLoadingIndicator', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DimmedLoadingIndicator(),
    ));

    final titleFinder = find.byType(SpinKitDualRing);
    expect(titleFinder, findsOneWidget);
  });
}
