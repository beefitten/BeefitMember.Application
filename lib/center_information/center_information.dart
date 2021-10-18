import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatelessWidget {
  CenterInformation();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(children: [
          TitleBanner('Center informations'),
          CenterInformationBasic(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TitleText('Location heat map'),
          ),
          CenterInformationHeatMap(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TitleText('Location'),
          ),
          CenterInformationMap(),
        ]),
      ),
    );
  }
}
