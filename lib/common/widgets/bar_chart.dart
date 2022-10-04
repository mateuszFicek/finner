import 'package:finner/common/extensions/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
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
              if (x % 5 == 0) return true;
              return x == 12;
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
        maxY: 20,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
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
                  toY: (6 + e % 4 * 4) / ((e + 1) % 3 + 1),
                  color: $styles.colors.accent2,
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
