import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatelessWidget {
  CenterInformation();

  final bool hasHeatMap = FitnessPackage.model.centerInformation.hasHeatmap;
  final bool showLocation = FitnessPackage.model.bookings.showLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              H1Text('Center information'),
              Expanded(
                child: ListView(children: [
                  showLocation ? CenterInformationMap() : Container(),
                  CenterInformationBasic(),
                  hasHeatMap
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: H2Text('Location heat map'),
                        )
                      : Container(),
                  hasHeatMap ? CenterInformationHeatMap() : Container(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
