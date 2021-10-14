import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:beefitmember_application/training_progression/widgets/title_banner.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleBanner("Weight Goal"),
          ImageBox(
            "https://2.bp.blogspot.com/-q3qJmAW1T_0/Vty1RAbGe4I/AAAAAAAAAlc/otdCoDEdMl8/s640/Arnold-Schwarzenegger-Champion-BodyBuilder.jpg",
          ),
          DescriptionText(
            "Setup a weight goal",
            "Get motivated by setting up a few simple weekly goals, and the app will keep track of whether you archive the goals every week. ",
          ),
          CustomButton(
            "Setup new weight goal",
            () => {},
          ),
        ],
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String _title;

  final String _text;

  DescriptionText(this._title, this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TitleText(_title),
          ),
          Text(
            _text,
          )
        ],
      ),
    );
  }
}
