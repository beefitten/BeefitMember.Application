import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_main.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/statics/get_padding.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.08),
        child: H1Text('Center Information'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getPadding(), right: getPadding()),
        child: BlocBuilder<CenterInformationBloc, CenterInformationState>(
            builder: (context, state) {
          if (state is InfoLoadedState)
            return BuildLoaded(state.map, state.model);
          else
            return BuildLoading();
        }),
      ),
    );
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
    return ListView(children: [
      CenterInformationMain(map, model),
      H2Text('Location heat map'),
      // FitnessPackage.model.centerInformation.hasHeatmap
      //     ? CenterInformationHeatMap()
      //     : Container(),
      CenterInformationHeatMap(model)
    ]);
  }
}
