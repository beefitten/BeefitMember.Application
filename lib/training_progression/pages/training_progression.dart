import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:flutter/material.dart';

class TrainingProgression extends StatefulWidget {
  const TrainingProgression({Key? key}) : super(key: key);

  @override
  State<TrainingProgression> createState() => _TrainingProgressionState();
}

class _TrainingProgressionState extends State<TrainingProgression> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleBanner("Weight Goal"),
            ImageBox(
              "https://2.bp.blogspot.com/-q3qJmAW1T_0/Vty1RAbGe4I/AAAAAAAAAlc/otdCoDEdMl8/s640/Arnold-Schwarzenegger-Champion-BodyBuilder.jpg",
            ),
            TitleText("Setup a weight goal"),
            Container(
              width: 100,
              child: DescriptionText(
                  "Get motivated by setting up a few simple weekly goals, and the app will keep track of whether you archive the goals every week. "),
            ),
            CustomButton("Setup new weight goal", () => _onButtonPressed(),
                Color(int.parse(FitnessPackage.secondaryColor))),
          ],
        ),
      ),
    );
  }

  _onButtonPressed() {
    showModalBottomSheet(
      context: (context),
      builder: (context) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.face),
              title: Text("Test"),
            )
          ],
        );
      },
    );
  }
}
