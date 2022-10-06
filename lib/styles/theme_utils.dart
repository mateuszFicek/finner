// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

import 'colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();
  late final _Corners corners = _Corners();
  late final _Shadows shadows = _Shadows();
  late final _Insets insets = _Insets();
  late final _Text text = _Text();
  final _Times times = _Times();
}

@immutable
class _Text {
  final TextStyle titleFont = TextStyle(color: $styles.colors.black);
  final TextStyle contentFont = TextStyle(color: $styles.colors.black);
  final TextStyle buttonFont = TextStyle(color: $styles.colors.white);

  late final TextStyle h1 = copy(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = copy(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      copy(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  late final TextStyle h4 = copy(contentFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

  late final TextStyle title1 =
      copy(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  late final TextStyle title2 = copy(titleFont, sizePx: 14, heightPx: 16.38);

  late final TextStyle body = copy(contentFont, sizePx: 16, heightPx: 27);
  late final TextStyle bodyBold =
      copy(contentFont, sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  late final TextStyle bodySmall = copy(contentFont, sizePx: 14, heightPx: 23);
  late final TextStyle bodyExtraSmall =
      copy(contentFont, sizePx: 12, heightPx: 18);
  late final TextStyle bodySmallBold =
      copy(contentFont, sizePx: 14, heightPx: 23, weight: FontWeight.w600);
  late final TextStyle btn =
      copy(buttonFont, weight: FontWeight.w400, sizePx: 18, heightPx: 46);

  TextStyle copy(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
  late final double big = 85;
  late final double large = 120;
}

@immutable
class _Shadows {
  final text = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 2),
        blurRadius: 2),
  ];
  final textStrong = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 4),
        blurRadius: 6),
  ];
}
