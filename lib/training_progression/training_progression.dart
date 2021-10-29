import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_bloc.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_events.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:beefitmember_application/training_progression/widgets/big_circle_chart.dart';
import 'package:beefitmember_application/training_progression/widgets/graph_box.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:beefitmember_application/training_progression/widgets/plus_minus_counter.dart';
import 'package:beefitmember_application/training_progression/widgets/time_limit_counter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingProgression extends StatefulWidget {
  const TrainingProgression({Key? key}) : super(key: key);

  @override
  State<TrainingProgression> createState() => _TrainingProgressionState();
}

class _TrainingProgressionState extends State<TrainingProgression> {
  late WeightGoalBloc weightGoalBloc;
  @override
  void initState() {
    weightGoalBloc = BlocProvider.of<WeightGoalBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (getLatestWeightGoal() == 0) {
      return emptyWeightGoalPage();
    } else {
      return weightGoalPage();
    }
  }

  Container emptyWeightGoalPage() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              H1Text("Weight Goal"),
              ImageBox(
                FitnessPackage.model.weightGoal.imagePath,
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
                Color(int.parse(FitnessPackage.model.thirdColor)),
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
        return _buildBottomSheet(80, 90);
      },
    );
  }

  Widget _buildBottomSheet(int currentWeight, int targetWeight) {
    int cw = currentWeight;
    int tw = targetWeight;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          H2Text("Setup a weight goal"),
          DescriptionText(
              "Get motivated by setting up a few simple weekly goals, and the app will keep track of whether you archive the goals every week."),
          H3Text("Your current weight"),
          PlusMinusCounter(onChanged: (value) => {cw = value}),
          H3Text("Your goal weight"),
          PlusMinusCounter(onChanged: (value) => {tw = value}),
          TimeLimitCounter(),
          CustomButton(
            "Save",
            () => {
              weightGoalBloc.add(
                SaveButtonPressed(
                  user: User.name,
                  currentWeight: cw,
                  targetWeight: tw,
                ),
              ),
            },
            Color(int.parse(FitnessPackage.model.primaryColor)),
          ),
        ],
      ),
    );
  }

  int getLatestWeightGoal() {
    //NOT IMPLEMENTED: Should retrive from database
    return 1;
  }

  Widget weightGoalPage() {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              H1Text("Weight Goal"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      BigCircleChart(57),
                      Center(
                          child: DescriptionText(
                              "That's ${43}% of your goal of loosing ${30} Kg")),
                      GraphBox("Weight", 85, dataPoints1),
                      GraphBox("Weight", 85, dataPoints2),
                      TrainingProgPreview(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Dummy data
List<FlSpot> dataPoints1 = const [
  FlSpot(1, 0.2),
  FlSpot(2, 0.3),
  FlSpot(3, 0.4),
  FlSpot(4, 0.3),
  FlSpot(5, 0.9),
  FlSpot(6, 2),
  FlSpot(7, 4),
  FlSpot(8, 6),
  FlSpot(9, 6.5),
  FlSpot(10, 7),
  FlSpot(11, 7.4),
  FlSpot(12, 7.2),
  FlSpot(13, 7.1),
  FlSpot(14, 7.1),
  FlSpot(15, 6),
  FlSpot(16, 5.8),
  FlSpot(17, 5.2),
  FlSpot(18, 5.1),
  FlSpot(19, 4),
  FlSpot(20, 3.7),
  FlSpot(21, 3.2),
  FlSpot(22, 3.6),
  FlSpot(23, 3.8),
  FlSpot(24, 3.10),
  FlSpot(25, 4),
  FlSpot(26, 5),
  FlSpot(27, 5.3),
  FlSpot(28, 5.6),
  FlSpot(29, 6),
];
List<FlSpot> dataPoints2 = const [
  FlSpot(1, 0.2),
  FlSpot(2, 0.3),
  FlSpot(3, 0.4),
  FlSpot(4, 0.3),
  FlSpot(5, 0.9),
  FlSpot(6, 3),
  FlSpot(7, 3.4),
  FlSpot(8, 6),
  FlSpot(9, 6.5),
  FlSpot(10, 3),
  FlSpot(11, 3),
  FlSpot(12, 4),
  FlSpot(13, 5.5),
  FlSpot(14, 4.5),
  FlSpot(15, 4),
  FlSpot(16, 6),
  FlSpot(17, 6.9),
  FlSpot(18, 6.5),
  FlSpot(19, 4.6),
  FlSpot(20, 3.7),
  FlSpot(21, 3.2),
  FlSpot(22, 2),
  FlSpot(23, 0.5),
  FlSpot(24, 0.1),
];
