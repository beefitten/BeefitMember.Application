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
    return 0;
  }

  Widget weightGoalPage() {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            children: [
              H1Text("Weight Goal"),
              BigCircleChart(57),
              Center(
                  child: DescriptionText(
                      "That's ${43}% of your goal of loosing ${30} Kg")),
              GraphBox("Weight", 85),
              GraphBox("Weight", 85),
              TrainingProgPreview(),
            ],
          ),
        ),
      ),
    );
  }
}
