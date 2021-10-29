import 'package:beefitmember_application/center_information/bloc/center_information_bloc.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/models/center_information_package.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blue = Color(int.parse(FitnessPackage.model.secondaryColor));

class CenterInformationHeatMap extends StatefulWidget {
  CenterInformationHeatMap();

  @override
  State<CenterInformationHeatMap> createState() =>
      _CenterInformationHeatMapState();
}

class _CenterInformationHeatMapState extends State<CenterInformationHeatMap> {
  final List<Color> colorGradient = [
    Color(int.parse(FitnessPackage.model.secondaryColor)),
    Color(int.parse(FitnessPackage.model.primaryColor)),
  ];
  final List<FlSpot> dataPoints = [];

  _CenterInformationHeatMapState() {
    for (var i = 0;
        i < CenterInformationPackage.model.heatMapDataPoints.length;
        i++) {
      dataPoints.add(FlSpot(
          double.parse(CenterInformationPackage.model.heatMapDataPoints
              .elementAt(i)
              .item1),
          double.parse(CenterInformationPackage.model.heatMapDataPoints
              .elementAt(i)
              .item2)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CenterInformationBloc, CenterInformationState>(
        builder: (context, state) {
      if (state is InfoLoadedState)
        return BuildLoaded(dataPoints, colorGradient);
      else
        return BuildLoading();
    });
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class BuildLoaded extends StatelessWidget {
  final List<FlSpot> dataPoints;
  final List<Color> colorGradient;

  BuildLoaded(this.dataPoints, this.colorGradient);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              double.parse(FitnessPackage.model.borderRadius))),
      elevation: double.parse(FitnessPackage.model.elevation),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: Color(int.parse(FitnessPackage.model.backgroundColor)),
              borderRadius: BorderRadius.circular(
                  double.parse(FitnessPackage.model.elevation))),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.3,
              maxWidth: MediaQuery.of(context).size.width),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                double.parse(FitnessPackage.model.elevation)),
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
                      colors:
                          colorGradient.map((e) => e.withOpacity(0.5)).toList(),
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
      ]),
    );
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
