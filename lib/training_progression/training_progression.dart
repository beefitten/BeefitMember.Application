import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_bloc.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_events.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_states.dart';
import 'package:beefitmember_application/training_progression/models/weight_goal_model.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:beefitmember_application/training_progression/widgets/big_circle_chart.dart';
import 'package:beefitmember_application/training_progression/widgets/graph_box.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:beefitmember_application/training_progression/widgets/plus_minus_counter.dart';
import 'package:beefitmember_application/training_progression/widgets/time_limit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

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
    weightGoalBloc.add(LoadingWeightGoalEvent(user: User.email));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.07),
              child: H1Text("Weight Goal")),
          body: BlocBuilder<WeightGoalBloc, WeightGoalState>(
            builder: (context, state) {
              if (state is LoadingWeightGoalState)
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor:
                        Color(int.parse(FitnessPackage.model.primaryColor)),
                  ),
                );
              else if (state is ShowWeightGoalState) {
                return showWeightGoal(state.json);
              } else if (state is CreateWeightGoalState) {
                return emptyWeightGoalPage();
              } else if (state is WeightGoalErrorState) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Container emptyWeightGoalPage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            Color(int.parse(FitnessPackage.model.primaryColor)),
          ),
        ],
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

  Widget showWeightGoal(WeightGoalModel model) {
    return ListView(
      children: [
        SizedBox(height: 20),
        BigCircleChart(67),
        Center(
          child: DescriptionText(
            "${model.currentWeight}",
            //"That's ${43}% of your goal of loosing ${30} Kg",
          ),
        ),
        GraphBox("Current Weight", model.currentWeight),
        GraphBox("Target Weight", model.targetWeight),
        TrainingProgPreview(),
      ],
    );
  }
}
