import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DimmedLoadingIndicator extends StatelessWidget {
  const DimmedLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: $styles.colors.black.withOpacity(0.65),
      child: Center(
        child: SpinKitDualRing(
          color: $styles.colors.accent3,
        ),
      ),
    );
  }
}
