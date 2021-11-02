import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_main.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/center_information_bloc.dart';
import 'bloc/center_information_events.dart';
import 'bloc/center_information_state.dart';

class CenterInformation extends StatefulWidget {
  CenterInformation();

  bool hasHeatMap = FitnessPackage.model.centerInformation.hasHeatmap;
  bool showLocation = FitnessPackage.model.bookings.showLocation;

  @override
  State<CenterInformation> createState() => _CenterInformationState();
}

class _CenterInformationState extends State<CenterInformation> {
  late CenterInformationBloc centerInfoBloc;

  @override
  void initState() {
    centerInfoBloc = BlocProvider.of<CenterInformationBloc>(context);
    centerInfoBloc.add(LoadEvent(fitnessName: FitnessPackage.model.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: BlocBuilder<CenterInformationBloc, CenterInformationState>(
            builder: (context, state) {
          if (state is InfoLoadedState)
            return BuildLoaded(state.map, state.model);
          else
            return BuildLoading();
        }),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class BuildLoaded extends StatelessWidget {
  final map;
  final model;

  BuildLoaded(this.map, this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        H1Text('Center information'),
        Expanded(
          child: ListView(children: [
            CenterInformationMain(map, model),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: H2Text('Location heat map'),
            ),
            // FitnessPackage.model.centerInformation.hasHeatmap
            //     ? CenterInformationHeatMap()
            //     : Container(),
            CenterInformationHeatMap(model)
          ]),
        ),
      ],
    );
  }
}
