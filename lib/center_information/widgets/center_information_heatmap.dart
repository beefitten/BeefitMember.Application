import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

final blue = Color(int.parse(FitnessPackage.model.secondaryColor));

class CenterInformationHeatMap extends StatelessWidget {
  final List<Color> colorGradient = [
    Color(int.parse(FitnessPackage.model.secondaryColor)),
    Color(int.parse(FitnessPackage.model.primaryColor)),
  ];

  final List<FlSpot> dataPoints = const [
    FlSpot(1, 0.2),
    FlSpot(2, 0.3),
    FlSpot(3, 0.4),
    FlSpot(4, 0.3),
    FlSpot(5, 0.9),
    FlSpot(6, 3),
    FlSpot(7, 3.4),
    FlSpot(8, 6),
    FlSpot(9, 6.5),
    FlSpot(10, 3),
    FlSpot(11, 3),
    FlSpot(12, 4),
    FlSpot(13, 5.5),
    FlSpot(14, 4.5),
    FlSpot(15, 4),
    FlSpot(16, 6),
    FlSpot(17, 6.9),
    FlSpot(18, 6.5),
    FlSpot(19, 4.6),
    FlSpot(20, 3.7),
    FlSpot(21, 3.2),
    FlSpot(22, 2),
    FlSpot(23, 0.5),
    FlSpot(24, 0.1),
  ];

  CenterInformationHeatMap();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Color(0xFFF7F7FC), borderRadius: BorderRadius.circular(10)),
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            maxWidth: MediaQuery.of(context).size.width),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LineChart(
            LineChartData(
              minX: 1,
              maxX: 23,
              minY: 0,
              maxY: 10,
              titlesData: LineTitles.getTitleData(),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: dataPoints,
                  isCurved: true,
                  colors: colorGradient.map((e) => e.withOpacity(0.5)).toList(),
                  barWidth: 5,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    colors:
                        colorGradient.map((e) => e.withOpacity(0.3)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: Text('Current status',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Text('HOT',
            style: TextStyle(
                fontSize: 26,
                color: Color(int.parse(FitnessPackage.model.secondaryColor)),
                fontWeight: FontWeight.bold)),
      )
    ]);
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      topTitles: SideTitles(showTitles: false),
      rightTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          margin: 8,
          getTitles: (value) {
            switch (value.toInt()) {
              case 3:
                return '03:00';
              case 9:
                return '09:00';
              case 15:
                return '15:00';
              case 21:
                return '21:00';
            }
            return '';
          }));
}
