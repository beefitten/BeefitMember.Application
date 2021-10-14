import 'package:beefitmember_application/shared/widgets/buttons.dart';
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
    return Column(
      children: [
        TitleBanner(),
        ImageBox(
            "https://2.bp.blogspot.com/-q3qJmAW1T_0/Vty1RAbGe4I/AAAAAAAAAlc/otdCoDEdMl8/s640/Arnold-Schwarzenegger-Champion-BodyBuilder.jpg"),
        // DescriptionText(),
        CustomButton("Setup new weight goal", () => {}),
      ],
    );
  }
}
