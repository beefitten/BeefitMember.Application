import 'package:beefitmember_application/bookings/pages/previewBookings/preview_bookings.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_bloc.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_events.dart';
import 'package:beefitmember_application/center_information/preview/center_information_preview.dart';
import 'package:beefitmember_application/overview/widgets/parallax_app_bar.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatefulWidget {
  @override
  OverviewState createState() => OverviewState();
}

class OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  late CenterInformationBloc centerInfoBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        body: ScrollConfiguration(
            behavior: ScrollSetup(),
            child: MediaQuery.removePadding(
                context: context, removeTop: true, child: previewList)),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[ParallaxAppBar()];
        },
      ),
    );
  }
}

class ScrollSetup extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

final previewList = Center(
  child: Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: ListView(
      children: [
        PreviewBookings(),
        TrainingProgPreview(),
        // CenterInformationPreview(),
        PreviewBookings(),
      ],
    ),
  ),
);
