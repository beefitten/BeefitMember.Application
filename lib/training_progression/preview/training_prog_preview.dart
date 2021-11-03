import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            H2Text('Weight Goal'),
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
    var _percentage = 43;
    double _weight = 30.0;
    return Card(
      elevation: 3,
      color: Color(0xfff7f7fc),
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.26),
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
                  H3Text("You've lost"),
                  ValueText(12.5),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: H3Text(
                      "That’s $_percentage\% of your goal of loosing $_weight kg",
                    ),
                  ),
                ],
              ),
              CircleChart(_percentage),
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
      "$_value kg",
      style: GoogleFonts.getFont(
        FitnessPackage.model.font.generalFont,
        fontSize: MediaQuery.of(context).size.height * 0.04,
        fontWeight: FontWeight.bold,
        color: Color(
          int.parse(FitnessPackage.model.thirdColor),
        ),
      ),
    );
  }
}

class CircleChart extends StatelessWidget {
  final int _percentage;

  CircleChart(this._percentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.2),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            strokeWidth: 8,
            color: Color(int.parse(FitnessPackage.model.secondaryColor)),
            backgroundColor: Colors.grey,
            value: _percentage / 100,
          ),
        ),
      ),
    );
  }
}
