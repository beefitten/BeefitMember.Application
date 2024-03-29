import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class BigCircleChart extends StatelessWidget {
  final double _percentage;

  BigCircleChart(this._percentage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            H3Text("You've Lost:"),
            H2Text("12.5 KG"),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            color: Color(int.parse(FitnessPackage.model.secondaryColor)),
            backgroundColor: Colors.grey,
            value: _percentage / 100,
          ),
        ),
      ],
    );
  }
}
