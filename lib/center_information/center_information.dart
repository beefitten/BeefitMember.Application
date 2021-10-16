import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatelessWidget {
  CenterInformation();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CenterInformationBasic(),
      CenterInformationHeatMap(),
      CenterInformationMap(),
    ]);
  }
}
