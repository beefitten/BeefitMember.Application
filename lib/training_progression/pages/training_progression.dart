import 'package:beefitmember_application/shared/widgets/buttons.dart';
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
    return Column(
      children: [
        TitleBanner(),
        // ImageBox(),
        // DescriptionText(),
        CustomButton("Setup new weightgoal", () => {}),
      ],
    );
  }
}
