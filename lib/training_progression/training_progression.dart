import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:beefitmember_application/training_progression/widgets/plus_minus_counter.dart';
import 'package:beefitmember_application/training_progression/widgets/time_limit_counter.dart';
import 'package:flutter/material.dart';

class TrainingProgression extends StatefulWidget {
  const TrainingProgression({Key? key}) : super(key: key);

  @override
  State<TrainingProgression> createState() => _TrainingProgressionState();
}

class _TrainingProgressionState extends State<TrainingProgression> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              H1Text("Weight Goal"),
              ImageBox(
                "https://2.bp.blogspot.com/-q3qJmAW1T_0/Vty1RAbGe4I/AAAAAAAAAlc/otdCoDEdMl8/s640/Arnold-Schwarzenegger-Champion-BodyBuilder.jpg",
              ),
              H2Text("Setup a weight goal"),
              Container(
                width: 100,
                child: DescriptionText(
                    "Get motivated by setting up a few simple weekly goals, and the app will keep track of whether you archive the goals every week. "),
              ),
              CustomButton(
                "Setup new weight goal",
                () => _showSheet(),
                Color(int.parse(FitnessPackage.primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSheet() {
    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * 0.9),
      context: (context),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 3,
      builder: (context) {
        return _buildBottomNavMenu();
      },
    );
  }

  Widget _buildBottomNavMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          H2Text("Setup a weight goal"),
          DescriptionText(
              "Get motivated by setting up a few simple weekly goals, and the app will keep track of whether you archive the goals every week."),
          H3Text("Your current weight"),
          PlusMinusCounter(onChanged: (value) => {value}),
          H3Text("Your goal weight"),
          PlusMinusCounter(onChanged: (value) => {value}),
          TimeLimitCounter(),
          ListTile(
            leading: Icon(Icons.surfing),
            title: Text("Test"),
          ),
          ListTile(
            leading: Icon(Icons.surfing),
            title: Text("Test"),
          ),
          ListTile(
            leading: Icon(Icons.surfing),
            title: Text("Test"),
          ),
        ],
      ),
    );
  }
}
