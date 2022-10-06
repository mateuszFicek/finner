import 'dart:math';

import 'package:finner/common/extensions/extensions.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class CustomBarChart extends StatefulWidget {
  final List<Spending> spendings;
  final double? spendingLimit;
  const CustomBarChart({
    super.key,
    required this.spendings,
    this.spendingLimit,
  });

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  List<double> summedValues = List.generate(7, (index) => 0);
  late var lineValue = (widget.spendingLimit ?? 0) / 30;

  @override
  void initState() {
    super.initState();
    for (var element in widget.spendings) {
      summedValues[element.date.weekday - 1] += element.amount;
    }
  }

  @override
  void didUpdateWidget(covariant CustomBarChart oldWidget) {
    summedValues = List.generate(7, (index) => 0);
    for (var element in widget.spendings) {
      summedValues[element.date.weekday - 1] += element.amount;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: $styles.colors.greyStrong,
          ),
        ),
        gridData: FlGridData(
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            checkToShowHorizontalLine: (x) {
              if (widget.spendingLimit != null) {
                return x == lineValue.toInt();
              }
              if (x % 25 == 0) return true;

              return false;
            },
            getDrawingHorizontalLine: (val) {
              if (val % 5 == 0) {
                return FlLine(
                  color: $styles.colors.greyMedium.withOpacity(0.25),
                  strokeWidth: 1,
                );
              }
              return FlLine(
                color: $styles.colors.accent1.withOpacity(0.5),
                dashArray: [6, 4],
                strokeWidth: 1,
              );
            }),
        maxY: (summedValues.reduce(max) + 50),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: ((value, meta) => Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      value.toStringAsFixed(0),
                    ),
                  )),
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: 38,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        barGroups: [
          ...List.generate(
            7,
            (e) => BarChartGroupData(
              x: e,
              barRods: [
                BarChartRodData(
                  toY: summedValues[e],
                  color: summedValues[e] > lineValue
                      ? $styles.colors.accent1
                      : $styles.colors.accent2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular($styles.insets.xxs),
                    topRight: Radius.circular($styles.insets.xxs),
                  ),
                  width: 32,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getTitles(double x, TitleMeta m) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        x.toInt().toWeekday(),
        style: $styles.text.contentFont.copyWith(fontSize: 10),
      ),
    );
  }
}
