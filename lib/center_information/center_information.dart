import 'package:beefitmember_application/center_information/bloc/center_information_events.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/center_information_bloc.dart';
import 'bloc/center_information_state.dart';

class CenterInformation extends StatefulWidget {
  CenterInformation();

  @override
  State<CenterInformation> createState() => _CenterInformationState();
}

class _CenterInformationState extends State<CenterInformation> {
  late CenterInformationBloc centerInfoBloc;

  @override
  void initState() {
    super.initState();
    centerInfoBloc = BlocProvider.of<CenterInformationBloc>(context);
    centerInfoBloc.add(LoadEvent(fitnessName: FitnessPackage.model.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: BlocBuilder<CenterInformationBloc, CenterInformationState>(
            builder: (context, state) {
          if (state is InfoLoadedState)
            return BuildLoaded(state.model, state.map);
          else
            return BuildLoading();
        }),
      ),
    ));
  }

  @override
  void dispose() {
    centerInfoBloc.dispose();
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
  final CenterInformationModel model;
  final GoogleMap map;

  BuildLoaded(this.model, this.map);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        H1Text('Center information'),
        Expanded(
          child: ListView(children: [
            CenterInformationMap(map, model),
            CenterInformationBasic(model),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: H2Text('Location heat map'),
            ),
            CenterInformationHeatMap(model),
          ]),
        ),
      ],
    );
  }
}
