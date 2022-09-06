import 'package:flutter/material.dart';

import 'styles/theme_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finner app',
      theme: $styles.colors.toThemeData(),
      home: DefaultTextStyle(
        style: $styles.text.body,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Finner"),
          ),
        ),
      ),
    );
  }
}
