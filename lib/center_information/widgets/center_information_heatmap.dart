import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CenterInformationHeatMap extends StatelessWidget {
  final List<Color> colorGradient = [
    Color(0xFFf54242),
    Color(0xFFf56342),
    Color(0xFFf57e42),
    Color(0xFF4293f5)
  ];

  CenterInformationHeatMap();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color(0xFFF7F7FC),
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            maxWidth: MediaQuery.of(context).size.width * 0.9),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false, drawVerticalLine: false),
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(2.6, 2),
                    FlSpot(4.9, 5),
                    FlSpot(6.8, 2.5),
                    FlSpot(8, 4),
                    FlSpot(9.5, 3),
                    FlSpot(11, 4)
                  ],
                  isCurved: true,
                  colors: colorGradient,
                  barWidth: 5,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                      show: true,
                      colors: colorGradient
                          .map((e) => e.withOpacity(0.3))
                          .toList()))
            ],
          ),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '8:00';
              case 3:
                return '10:00';
              case 4:
                return '12:00';
              case 5:
                return '14:00';
              case 6:
                return '16:00';
              case 7:
                return '17:00';
              case 8:
                return '18:00';
            }
            return '';
          }));
}
