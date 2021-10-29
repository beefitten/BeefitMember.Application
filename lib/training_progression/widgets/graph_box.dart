import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphBox extends StatelessWidget {
  final String title;

  final int value;

  List<FlSpot> data;

  GraphBox(this.title, this.value, this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          // color: Color(int.parse(FitnessPackage.model.primaryColor)),
        ),

        // color: Color(int.parse(FitnessPackage.model.backgroundColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  H3Text(title),
                  H2Text("$value Kg"),
                  H3Text("Last messurement"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Graph(this.data),
            ),
          ],
        ),
      ),
    );
  }
}

class Graph extends StatelessWidget {
  final List<Color> colorGradient = [
    Color(int.parse(FitnessPackage.model.secondaryColor)),
    Color(int.parse(FitnessPackage.model.primaryColor)),
  ];

  final List<FlSpot> data;

  Graph(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.13,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          minX: 1,
          // maxX: 31,
          minY: 0,
          maxY: 10,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              colors: colorGradient.map((e) => e.withOpacity(0.5)).toList(),
              barWidth: 5,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: colorGradient.map((e) => e.withOpacity(0.3)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
