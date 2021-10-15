import 'dart:ffi';

import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class TrainingProgPreview extends StatelessWidget {
  const TrainingProgPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleText("Weight goal"),
            ShowMore(),
          ],
        ),
        GoalWidget(),
      ],
    );
  }
}

class GoalWidget extends StatefulWidget {
  const GoalWidget({Key? key}) : super(key: key);

  @override
  _GoalWidgetState createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  @override
  Widget build(BuildContext context) {
    var percentage = 43;
    double weight = 30.0;
    return Card(
      elevation: 3,
      color: Color(0xfff7f7fc),
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("You've lost"),
                  ValueText(12.5),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DescriptionText(
                        "That’s $percentage\% of your goal of loosing $weight kg"),
                  ),
                ],
              ),
              CircleChart(),
            ],
          ),
        ),
      ),
    );
  }
}

class ValueText extends StatelessWidget {
  final double _value;

  const ValueText(this._value);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_value} kg",
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.04,
          fontWeight: FontWeight.bold),
    );
  }
}

class CircleChart extends StatelessWidget {
  const CircleChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.purple,
          radius: MediaQuery.of(context).size.width * 0.13,
        ),
      ),
    );
  }
}
